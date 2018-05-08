<?php
/**
 *  src/UtilisateurBundle/Form/RegistrationType.php
 */

namespace UtilisateurBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\DateType;

/**
 * classe RegistrationType
 */
class RegistrationType extends AbstractType
{
    /**
     * Cr�ation du formulaire d'inscription d'un utilisateur
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
        return 'FOS\UserBundle\Form\Type\RegistrationFormType';
    }

    public function getBlockPrefix()
    {
        return 'app_user_registration';
    }

    // For Symfony 2.x
    /*public function getName()
    {
        return $this->getBlockPrefix();
    }*/
}