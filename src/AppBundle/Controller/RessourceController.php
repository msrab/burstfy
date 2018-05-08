<?php

/**
 * src/AppBundle/Controller/RessourceController.php
 * Controller des ressources
 */

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Ressource;
use AppBundle\Form\RessourceType;
use Cocur\Slugify\Slugify;

/**
 * Controller Ressource
 */
class RessourceController extends Controller {

    /**
     * Affiche la liste des ressources par pages et par categories ou non
     * 
     * @param string $slugCategorie  le slug de la cat�gorie (si on filtre par cat�gorie)
     * @param int $page  le numero de la page � afficher
     * @return render (vue, array(obj $ressources, int $page, string $route, string $slugCategorie, int $nbrRessources)
     */
    public function getListeAction(string $slugCategorie = null, int $page = 1) {
        $em = $this
                ->getDoctrine()
                ->getManager();

        // R�cuperation des ressources correspondant � la cat�gorie
        if ($slugCategorie != null) {
            $categorie = $em
                    ->getRepository('AppBundle:Categorie')
                    ->findOneBySlug($slugCategorie);

            $nbrRessources = count($em->getRepository('AppBundle:Ressource')
                            ->findByCategorie($categorie));

            $ressources = $em
                    ->getRepository('AppBundle:Ressource')
                    ->findBy(
                            array('categorie' => $categorie), 
                            array('datePublication' => 'DESC'), 
                            $this->getParameter('nbrArticlesParPage'), 
                            ($page - 1) * $this->getParameter('nbrArticlesParPage'));

            $route = 'site_ressource_categorie';
        }
        //R�cup�ration des ressources sans filtre de cat�gorie
        else {
            $nbrRessources = count($em
                    ->getRepository('AppBundle:Ressource')
                    ->findAll());

            $ressources = $em
                    ->getRepository('AppBundle:Ressource')
                    ->findBy(
                            array(), 
                            array('datePublication' => 'DESC'), 
                            $this->getParameter('nbrArticlesParPage'), 
                            ($page - 1) * $this->getParameter('nbrArticlesParPage'));

            $route = 'site_ressource';
        }

        return $this->render(
                'AppBundle:Ressource:liste.html.twig', 
                array(
                    'ressources' => $ressources,
                    'page' => $page,
                    'route' => $route,
                    'slugCategorie' => $slugCategorie,
                    'nbrRessources' => $nbrRessources));
    }

    /**
     * Affiche la page de d�tails d'une ressource
     * 
     * @param string $slugRessource slug de la ressource � afficher
     * @return render (vue, array(obj $ressource, int $idUtilisateur))
     */
    public function getDetailsAction(string $slugRessource) {
        $em = $this
                ->getDoctrine()
                ->getManager();

        $ressource = $em
                ->getRepository('AppBundle:Ressource')
                ->findOneBySlug($slugRessource);

        $idUtilisateur = $this
                ->container
                ->get('security.token_storage')
                ->getToken()
                ->getUser()
                ->getId();

        return $this->render(
                'AppBundle:Ressource:details.html.twig', 
                array(
                    'ressource' => $ressource,
                    'idUtilisateur' => $idUtilisateur));
    }

    /**
     * Affiche des ressources al�atoirement de la m�me cat�gorie que la ressource courante
     * 
     * @param int $idCategorie id de la categorie 
     * @param int $maxResultats nombre de ressources � afficher
     * @param int $idRessource id de la ressource courante
     * @return render (vue, array(obj $ressources, obj $categorie))
     */
    public function getRandomAction(int $idCategorie, int $maxResultats, int $idRessource) {
        $em = $this
                ->getDoctrine()
                ->getManager();

        $ressources = $em
                ->getRepository('AppBundle:Ressource')
                ->findRandom($idCategorie, $maxResultats, $idRessource);

        $categorie = $em
                ->getRepository('AppBundle:Categorie')
                ->find($idCategorie);

        return $this
                ->render(
                        'AppBundle:Ressource:random.html.twig', 
                        array(
                            'ressources' => $ressources,
                            'categorie' => $categorie));
    }

    /**
     * Compte le nombre de vues d'une ressource
     * 
     * @param string $slugRessource slug de la ressource affich�
     * @return render (vue, array(int $vues))
     */
    public function compteurVueAction(string $slugRessource) {
        $em = $this
                ->getDoctrine()
                ->getManager();

        $ressource = $em
                ->getRepository('AppBundle:Ressource')
                ->findOneBySlug($slugRessource);

        $ressource->setNbrVue($ressource->getNbrVue() + 1);

        $em->persist($ressource);
        $em->flush();

        return $this
                ->render(
                        'AppBundle:Ressource:vues.html.twig', 
                        array('vues' => $ressource->getNbrVue()));
    }

    /**
     * Affiche le formulaire de cr�ation d'une ressource, ou enregistre la ressource cr��
     * @param Request $request les donn�es envoy�s via le formulaire de cr�ation
     * @return render soit du formulaire, soit de la ressource cr��
     */
    public function addAction(Request $request) {
        $ressource = new Ressource();

        $form = $this->createForm(RessourceType::class, $ressource);
        $form->handleRequest($request);

        //Si le formulaire est envoy�
        if ($form->isSubmitted() && $form->isValid()) {
            $image = $ressource->getImage();
            $fichier = $ressource->getFichier();

            //Si des fichiers sont envoy�s
            if ($image != null && $fichier != null) {
                
                //On renome les noms de fichiers
                $nomImage = md5(uniqid()) . '.' . $image->guessExtension();
                $nomFichier = md5(uniqid()) . '.' . $fichier->guessExtension();
                
                //On d�place les fichiers vers le dossier final
                $image->move(
                        $this->getParameter('images_directory'), 
                        $nomImage);
                $fichier->move(
                        $this->getParameter('ressources_directory'), 
                        $nomFichier);

                $ressource->setImage($nomImage);
                $ressource->setFichier($nomFichier);

                //Enregistrement du poids du fichier
                $size = $_FILES['appbundle_ressource']['size']['fichier'];
                $ressource->setPoidsFichier($size / 1048576);

                $ressource->setUtilisateur($this
                        ->container
                        ->get('security.token_storage')
                        ->getToken()
                        ->getUser());

                //On "slug le titre"
                $slugify = new Slugify();
                $ressource->setSlug(
                        $slugify->slugify(
                                $ressource->getTitre(), '_'));

                $em = $this->getDoctrine()->getManager();
                $em->persist($ressource);
                $em->flush();

                //redirige vers la page de d�tails de la ressource cr��
                return $this->redirect(
                                $this->generateUrl(
                                        'site_ressource_details', 
                                        array(
                                            'slugRessource' => $ressource->getSlug())));
            }
            //retourne le formulaire avec un message d'erreur
            return $this->redirect(
                            $this->generateUrl(
                                    'site_ressource_add', 
                                    array('error' => "Fichier introuvable.")));
        }

        //retourne le formulaire 
        return $this->render(
                'AppBundle:Ressource:add.html.twig', 
                array('form' => $form->createView()));
    }

    /**
     * Supprime une ressource
     * 
     * @param string $slugRessource slug de la ressource � supprimer
     * @return redirection vers home ou vers la ressource s'il elle n'est pas supprim�
     */
    public function deleteAction(string $slugRessource) {
        $em = $this->getDoctrine()->getManager();

        $user = $this
                ->container
                ->get('security.token_storage')
                ->getToken()
                ->getUser();
        
        $ressource = $em
                ->getRepository('AppBundle:Ressource')
                ->findOneBy(
                        array(
                            'slug' =>$slugRessource,
                            'utilisateur' => $user
                ));
        
        
        //On v�rifie que la ressource appartient bien � l'utilisateur
        if ($ressource != null) {
            $em->remove($ressource);

            $lienImage = 'media/uploads/images/' . $ressource->getImage();
            unlink($lienImage);

            $lienFichier = 'media/uploads/ressources/' . $ressource->getFichier();
            unlink($lienFichier);

            $em->flush();

            return $this->redirectToRoute('site_ressource');
        } 
        else {
            return $this->redirectToRoute('site_ressource');
            //return $this->redirectToRoute(
            //        'site_ressource_details', 
            //        array('slugRessource' => $ressource->getSlug()));
        }
    }

    /**
     * Affiche le formulaire de modification d'une ressource, ou enregistre les modification de la ressource
     * 
     * @param string $slugRessource slug de la ressource � modifier
     * @param Request $request les donn�es envoy�s via le formulaire de modification
     * @return render soit du formulaire, soit de la ressource modifi�
     */
    public function editAction(string $slugRessource, Request $request) {
        $em = $this->getDoctrine()->getManager();

        $ressource = $em
                ->getRepository('AppBundle:Ressource')
                ->findOneBySlug($slugRessource);

        //On v�rifie que la ressource appartient � l'utilisateur
        if ($ressource->getUtilisateur()->getId() == 
                $this->container->get('security.token_storage')->getToken()->getUser()->getId()) {
            
            //On v�rifie si le formulaire a �t� envoy�
            if ($request->getMethod() == 'POST') {
                $form = $_POST['appbundle_ressource'];

                $ressource->setTitre($form['titre']);
                $ressource->setDescription($form['description']);

                $categorie = $em
                        ->getRepository('AppBundle:Categorie')
                        ->find($form['categorie']);

                $ressource->setCategorie($categorie);

                //On slug par rapport au titre
                $slugify = new Slugify();
                $ressource->setSlug($slugify->slugify($ressource->getTitre(), '_'));

                //On v�rifi� si une image � �t� envoy�
                if ($_FILES['appbundle_ressource']['name']['image'] != null) {
                    $image = $_FILES['appbundle_ressource']['name']['image'];

                    // Recupere l'extension de l'image
                    $extension = explode('.', $image);
                    $nbr = count($extension);
                    $extension = $extension[$nbr - 1];

                    //On supprime l'ancienne image
                    $dossierImage = $this->getParameter('images_directory');
                    unlink($dossierImage . '/' . $ressource->getImage());

                    //On renome la nouvelle image
                    $nomImage = md5(uniqid()) . '.' . $extension;

                    $image = $_FILES['appbundle_ressource']['tmp_name']['image'];

                    //on d�place l'image vers le dossier final
                    $image = move_uploaded_file($image, $dossierImage . '/' . $nomImage);

                    $ressource->setImage($nomImage);
                }

                //On v�rifie si un fichier a �t� envoy�
                if ($_FILES['appbundle_ressource']['name']['fichier'] != null) {
                    $fichier = $_FILES['appbundle_ressource']['name']['fichier'];

                    // Recupere l'extension du fichier
                    $extension = explode('.', $fichier);
                    $nbr = count($extension);
                    $extension = $extension[$nbr - 1];

                    $dossierFichier = $this->getParameter('ressources_directory');
                    unlink($dossierFichier . '/' . $ressource->getFichier());

                    $nomFichier = md5(uniqid()) . '.' . $extension;

                    $fichier = $_FILES['appbundle_ressource']['tmp_name']['fichier'];

                    $fichier = move_uploaded_file($fichier, $dossierFichier . '/' . $nomFichier);

                    $ressource->setFichier($nomFichier);

                    $size = $_FILES['appbundle_ressource']['size']['fichier'];
                    $ressource->setPoidsFichier($size / 1048576);
                }

                $em->flush();

                //Retourne vers la page de d�tails de la r�ssource que l'on vient de modifier
                return $this->redirectToRoute(
                        'site_ressource_details', 
                        array('slugRessource' => $ressource->getSlug()));
            }

            $categories = $em
                    ->getRepository('AppBundle:Categorie')
                    ->findAll();

            //Retourne le formulaire de modification de la ressource avec les donn�es � modifier
            return $this->render(
                    'AppBundle:Ressource:edit.html.twig', 
                    array(
                        'ressource' => $ressource, 
                        'categories' => $categories));
        }
        //Retourne vers la page de d�tails de la ressource si elle n'appartient pas � l'utilisateur
        return $this->redirectToRoute(
                'site_ressource_details', 
                array('slugRessource' => $ressource->getSlug()));
    }

    /**
     * Affiche la pagination 
     * 
     * @param int $page page courrante
     * @param string $route site_ressource
     * @param int $nbrRessources nombres de ressources
     * @param string $slugCategorie slug de la cat�gorie si on filtre par cat�gorie
     * @return render de la pagination (vue, array(array $pagination, string route, string $slugCategorie))
     */
    public function getPaginationAction(int $page = 1, string $route = 'site_ressource', int $nbrRessources = 1, string $slugCategorie = null) {
        $nbrPages = (int)
                (0.9 + ($nbrRessources / $this->getParameter('nbrArticlesParPage')));

        if ($nbrPages > 1 && $page > 1)
            $pagination['precedent'] = $page - 1;
        else
            $pagination['precedent'] = 0;
        if ($page < $nbrPages)
            $pagination['suivant'] = $page + 1;
        else
            $pagination['suivant'] = 0;

        return $this->render(
                'AppBundle:Ressource:pagination.html.twig', 
                array(
                    'pagination' => $pagination,
                    'route' => $route,
                    'slugCategorie' => $slugCategorie));
    }

    /**
     * Affiche la liste personnelle des ressources cr�� par l'utilisateur
     * 
     * @param type $utilisateur l'utilisateur connect�
     * @return render (vue, array(obj $ressources)) ou null
     */
    public function getMyListeAction($utilisateur) {
        $em = $this->getDoctrine()->getManager();

        //On v�rifie que l'utilisateur est connect�
        if ($utilisateur != null) {
            $ressources = $em
                    ->getRepository('AppBundle:Ressource')
                    ->findBy(
                            array('utilisateur' => $utilisateur), 
                            array('datePublication' => 'DESC'));

            return $this->render(
                    'AppBundle:Ressource:myListe.html.twig', 
                    array('ressources' => $ressources));
        }

        return null;
    }

    /**
     * Fonction de t�lechargement d'une ressource � partir d'un lien de telechargement
     * @param string $fichier nom du fichier
     * @return exit()
     */
    public function uploadAction($fichier) {

        $fichier = $this->getParameter('ressources_directory') . '/' . $fichier;
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename=' . basename($fichier));
        header('Accept-Ranges: bytes');
        header('Content-Length: ' . filesize($fichier));
        readfile($fichier);
        return exit();
    }

}
