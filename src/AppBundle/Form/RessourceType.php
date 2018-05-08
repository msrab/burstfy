<?php
// src/AppBundle/Form/RessourceType.php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class RessourceType extends AbstractType
{
    /**
     * Creation du formulaire de création d'une ressource
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
                ->add('titre')
                ->add('description')
                ->add('categorie', EntityType::class, array('class' => 'AppBundle:Categorie', 'choice_label'=>'nom'))
                ->add('image', FileType::class, array('label' => 'Image'))
                ->add('fichier', FileType::class, array(
                    'label' => 'Fichier' ))
                ;
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Ressource'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_ressource';
    }


}
