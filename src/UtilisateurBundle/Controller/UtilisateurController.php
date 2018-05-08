<?php
/**
 * src/UtilisateurBundle/Controller/UtilisateurController.php
 * Controlleurs des utilisateurs
 */

namespace UtilisateurBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use UtilisateurBundle\Entity\Utilisateur;

/**
 * classe UtilisateurController
 */
class UtilisateurController extends Controller {

    /**
     * Affiche et modifie l'avatar d'un utilisateur
     * 
     * @param Request $request donn�e envoy�e via le formulaire
     * @return render soit le formualire de modification soit redirection vers le profil
     */
    public function editAvatarAction(Request $request) {
        
        //On v�rifie si le formulaire a �t� envoy�
        if ($request->getMethod() == 'POST') {
            if ($_FILES['avatar']['name'] != null) {
                $em = $this->getDoctrine()->getManager();

                $utilisateur = $em
                        ->getRepository('UtilisateurBundle:Utilisateur')
                        ->find($this
                                ->container
                                ->get('security.token_storage')
                                ->getToken()
                                ->getUser()
                                ->getId());


                $image = $_FILES['avatar']['name'];

                // Recupere l'extension de l'image
                $extension = explode('.', $image);
                $nbr = count($extension);
                $extension = $extension[$nbr - 1];

                $dossierImage = $this->getParameter('avatars_directory');
                //unlink($dossierImage . '/' . $utilisateur->getAvatar());

                $nomImage = md5(uniqid()) . '.' . $extension;

                $image = $_FILES['avatar']['tmp_name'];

                $image = move_uploaded_file(
                        $image, 
                        $dossierImage . '/' . $nomImage);

                $utilisateur->setAvatar($nomImage);
                $em->flush();

                return $this->redirectToRoute('fos_user_profile_show');
            }
        } else {
            return $this->render('UtilisateurBundle:Utilisateur:editAvatar.html.twig');
        }
    }

}
