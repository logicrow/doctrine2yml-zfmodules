<?php

class Core_Form_Theme extends Zend_Form
{
    public function __construct()
    {
        parent::__construct();
        $this->_setupElements();
    }

    private  function _setupElements()
    {
        $translate = Zend_Registry::get('Zend_Translate');

        $this->setAttrib('id', 'themeForm');
	    $this->setTranslator($translate);
            
    	$name = new Zend_Form_Element_Text('name');
    	$name->setRequired(true)
              ->addFilter('StringTrim')
              ->addFilter('StripTags')
              ->removeDecorator('HtmlTag')
              ->removeDecorator('DtDWrapper')
              ->removeDecorator('label')
              ->setErrorMessages(array('Username is required'));


    	$cssProperty = new Zend_Form_Element_Hidden('cssProperty');
    	$cssProperty->setRequired(true)
                ->removeDecorator('HtmlTag')
                ->removeDecorator('DtDWrapper')
                ->removeDecorator('label')
                ->setAttrib('id', 'css-property');
        
        $submit = new Zend_Form_Element_Submit('save');
        $submit->setLabel('Save Theme');


        $submit->removeDecorator('DtDdWrapper')
              ->removeDecorator('HtmlTag')
	      ->setAttrib('class', 'u-login');

        $this->addElements(array($name, $cssProperty, $submit));
    }
}
