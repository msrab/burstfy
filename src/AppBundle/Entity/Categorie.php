<?php
/**
 *  src/AppBundle/Entity/Categorie.php
 *  Entité de catégorie
 */

namespace AppBundle\Entity;

use Cocur\Slugify\Slugify;
use Doctrine\ORM\Mapping as ORM;

/**
 * Categorie
 *
 * @ORM\Table(name="categorie")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CategorieRepository")
 */
class Categorie
{
    /**
     * @var int id
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string nom
     *
     * @ORM\Column(name="nom", type="string", length=255)
     */
    private $nom;
    
    /**
     * @var string slug
     *
     * @ORM\Column(name="slug", type="string", length=128, unique=true)
     */
    private $slug;

    /**
     * @var string image
     *
     * @ORM\Column(name="image", type="string", length=255)
     */
    private $image;

    /**
     * constructeur
     */
    public function __construct()
    {
        parent::__construct();
        
        $slugify = new Slugify();
        $this->slug =  $slugify->slugify($this->nom, '_'); 
    }
    
    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return Categorie
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set image
     *
     * @param string $image
     *
     * @return Categorie
     */
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return string
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set slug
     *
     * @param string $slug
     *
     * @return Categorie
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * Get slug
     *
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }
}
