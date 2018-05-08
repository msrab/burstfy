<?php
/**
 *  src/UtilisateurBundle/Form/ProfileType.php
 */

namespace UtilisateurBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class ProfileType extends AbstractType
{
    /**
     * Cr�ation du formulaire de modification d'un utilisateur
     * 
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
                ->add('nom')
                ->add('prenom');
    }

    public function getParent()
    {
        return 'FOS\UserBundle\Form\Type\ProfileFormType';
    }

    public function getBlockPrefix()
    {
        return 'app_user_profile';
    }

    // For Symfony 2.x
    /*public function getName()
    {
        return $this->getBlockPrefix();
    }*/
}