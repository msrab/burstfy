<?php
/**
 *  src/CommentaireBundle/Entity/Commentaire.php
 * entité Commentaire
 */

namespace CommentaireBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Commentaire
 *
 * @ORM\Table(name="commentaire")
 * @ORM\Entity(repositoryClass="CommentaireBundle\Repository\CommentaireRepository")
 */
class Commentaire
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
     * @var \DateTime datePublication
     *
     * @ORM\Column(name="datePublication", type="datetime")
     */
    private $datePublication;

    /**
     * @var string texte
     *
     * @ORM\Column(name="texte", type="text")
     */
    private $texte;

    /**
     * @var obj utilisateur
     * 
     * @ORM\ManyToOne(targetEntity="UtilisateurBundle\Entity\Utilisateur", inversedBy="commentaires")
     * @ORM\JoinColumn(nullable=true)
     */
    private $utilisateur;

    /**
     * @var obj ressource
     * 
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Ressource", inversedBy="commentaires")
     * @ORM\JoinColumn(nullable=true)
     */
    private $ressource;
    
    /**
     * constructeur
     */
    public function __construct()
    {
        //parent::__construct();
        $this->datePublication = new \DateTime();
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
     * Set date
     *
     * @param \DateTime $date
     *
     * @return Commentaire
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set texte
     *
     * @param string $texte
     *
     * @return Commentaire
     */
    public function setTexte($texte)
    {
        $this->texte = $texte;

        return $this;
    }

    /**
     * Get texte
     *
     * @return string
     */
    public function getTexte()
    {
        return $this->texte;
    }

    /**
     * Set datePublication
     *
     * @param \DateTime $datePublication
     *
     * @return Commentaire
     */
    public function setDatePublication($datePublication)
    {
        $this->datePublication = $datePublication;

        return $this;
    }

    /**
     * Get datePublication
     *
     * @return \DateTime
     */
    public function getDatePublication()
    {
        return $this->datePublication;
    }

    /**
     * Set utilisateur
     *
     * @param \UtilisateurBundle\Entity\Utilisateur $utilisateur
     *
     * @return Commentaire
     */
    public function setUtilisateur(\UtilisateurBundle\Entity\Utilisateur $utilisateur = null)
    {
        $this->utilisateur = $utilisateur;

        return $this;
    }

    /**
     * Get utilisateur
     *
     * @return \UtilisateurBundle\Entity\Utilisateur
     */
    public function getUtilisateur()
    {
        return $this->utilisateur;
    }

    /**
     * Set ressource
     *
     * @param \AppBundle\Entity\Ressource $ressource
     *
     * @return Commentaire
     */
    public function setRessource(\AppBundle\Entity\Ressource $ressource = null)
    {
        $this->ressource = $ressource;

        return $this;
    }

    /**
     * Get ressource
     *
     * @return \AppBundle\Entity\Ressource
     */
    public function getRessource()
    {
        return $this->ressource;
    }
}
