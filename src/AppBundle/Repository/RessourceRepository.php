<?php
/**
 *  src/AppBundle/Repository/RessourceRepository.php
 * Repository de ressource
 */

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * RessourceRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class RessourceRepository extends \Doctrine\ORM\EntityRepository
{
    /**
     * R�cup�re des ressources al�atoirement par rapport � l'id d'une cat�gorie
     * 
     * @param int idCategorie id de la categorie
     * @param int maxResultats nombre de resultats � r�cup�rer
     * @param int idRessource id de la ressource courrante
     * @return obj (ressources) 
     */
    public function findRandom(int $idCategorie, int $maxResultats, int $idRessource)
    {
        return $this->createQueryBuilder('r')
                ->addSelect('RAND() AS HIDDEN RAND')
                ->where('r.categorie = :idCategorie')
                ->andWhere('r.id <> :idRessource')
                ->addOrderBy('RAND')
                ->setParameter('idCategorie', $idCategorie)
                ->setParameter('idRessource', $idRessource)
                ->setMaxResults($maxResultats)
                ->getQuery()
                ->getResult();
    }
}
