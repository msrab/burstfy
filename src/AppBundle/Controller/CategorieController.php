<?php
/**
 * src/AppBundle/Controller/CategorieController.php
 * Controller des catégories
 */

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

/**
 * Controller des catégories
 */
class CategorieController extends Controller
{
    /**
     * Affiche la liste des categories
     * 
     * @return render
     */
    public function getListeAction()
    {
        $em = $this
                ->getDoctrine()
                ->getManager();
        
        $categories = $em
                ->getRepository('AppBundle:Categorie')
                ->findAll();
        
        return $this->render('AppBundle:Categorie:liste.html.twig', 
                array('categories' => $categories));
    }
}