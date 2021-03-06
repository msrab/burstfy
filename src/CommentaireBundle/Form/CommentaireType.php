<?php
// src/CommentaireBundle/Form/CommentaireType.php

namespace CommentaireBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CommentaireType extends AbstractType {

    /**
     * Cr�ation du formulaire d'ajout de commentaire
     * 
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add(
                'texte', null, 
                array(
                    'label' => FALSE,
                    'attr' => array(
                        'placeholder' => 'Votre Message',
                        'id' => "message",
                        'maxLength' => '500',
                        'tabindex' => '5',
                        'cols' => '30',
                        'rows' => '4'
                        )
                    )
                )
                ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver) {
        $resolver->setDefaults(array(
            'data_class' => 'CommentaireBundle\Entity\Commentaire'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix() {
        return 'commentairebundle_commentaire';
    }

}
