<?php
/**
 * src/CommentaireBundle/Controller/CommentaireController.php
 * Controller des commentaires
 */

namespace CommentaireBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use CommentaireBundle\Entity\Commentaire;
use CommentaireBundle\Form\CommentaireType;

/**
 * Controller des commentaires
 */
class CommentaireController extends Controller {

    /**
     * Affiche la liste des commentaire d'une ressource
     * 
     * @param type $ressource ressource courrante
     * @return render (vue, array(obj $commentaires))
     */
    public function getListeAction($ressource) {
        $em = $this->getDoctrine()->getManager();
        
        $commentaires = $em
                ->getRepository('CommentaireBundle:Commentaire')
                ->findByRessource($ressource);

        return $this->render(
                'CommentaireBundle:Commentaire:liste.html.twig', 
                array('commentaires' => $commentaires));
    }

    /**
     * Affiche le formulaire d'ajout de commentaire
     * 
     * @param int $idRessource id de la ressource courrante
     * @param request $request données envoyés via le formulaire
     * @return render (vue, array(obj $formCommentaire, obj $commentaire))
     */
    public function addAction(int $idRessource, Request $request) {
        $em = $this->getDoctrine()->getManager();

        $ressource = $em
                ->getRepository('AppBundle:Ressource')
                ->findOneById($idRessource);

        $commentaire = new Commentaire();
        $commentaire->setRessource($ressource);

        $formCommentaire = $this->createForm(CommentaireType::class, $commentaire);
        $formCommentaire->handleRequest($request);

        /*if ($formCommentaire->isSubmitted() && $formCommentaire->isValid()) {
            $commentaire->setUtilisateur($this->container
                    ->get('security.token_storage')
                    ->getToken()->getUser());

            $em->persist($commentaire);
            $em->flush();

            return $this->redirectToRoute(
                    'site_ressource_details', 
                    array(
                        'slugRessource' => $commentaire->getRessource()->getSlug()));
            
        }*/


        return $this->render(
                'CommentaireBundle:Commentaire:add.html.twig', 
                array(
                    'formCommentaire' => $formCommentaire->createView(),
                    'commentaire' => $commentaire));
    }

    /**
     * Enregistrement d'un commentaire en ajax
     * 
     * @param Request $request donn�es envoy�s via le formulaire d'ajout de commentaire
     * @return render de la vue du commentaire
     */
    public function ajaxAction(Request $request) {
        $em = $this->getDoctrine()->getManager();

        $idRessource = $request->request->get('idRessource');
        
        $texte = $request->request->get('commentaire');

        $ressource = $em
                ->getRepository('AppBundle:Ressource')
                ->find($idRessource);

        $commentaire = new Commentaire();
        $commentaire->setRessource($ressource);
        $commentaire->setUtilisateur($this
                ->container
                ->get('security.token_storage')
                ->getToken()
                ->getUser());
        
        $commentaire->setTexte($texte);

        $em->persist($commentaire);
        $em->flush();
        
        return $this->render(
                'CommentaireBundle:Commentaire:commentaire.html.twig', 
                array(
                    'commentaire' =>$commentaire));
    }

}
