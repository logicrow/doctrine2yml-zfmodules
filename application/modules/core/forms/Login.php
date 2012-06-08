<?php

class Core_Form_Login extends Zend_Form
{
    public function __construct()
    {
        parent::__construct();
        $this->_setupElements();
    }

    private  function _setupElements()
    {
        $translate = Zend_Registry::get('Zend_Translate');

        $this->setAttrib('id', 'loginForm');
	    $this->setTranslator($translate);
    	$username = new Zend_Form_Element_Text('username');
    	$username->setRequired(true)
              ->addFilter('StringTrim')
              ->addFilter('StripTags')
              ->removeDecorator('HtmlTag')
              ->removeDecorator('DtDWrapper')
              ->removeDecorator('label')
              ->setErrorMessages(array('Username is required'));


    	$password = new Zend_Form_Element_Password('password');
    	$password->setRequired(true)
                ->removeDecorator('HtmlTag')
                ->removeDecorator('DtDWrapper')
                ->removeDecorator('label')
                ->setAttrib('id', 'txt-password')
                ->setErrorMessages(array('Password is required'));


        $remember = new Zend_Form_Element_Checkbox('remember');
       	$remember->setLabel('RememberMe')
       			->removeDecorator('HtmlTag')
       			->getDecorator('label')
			->setOption('placement', 'APPEND')
			->setOption('tag', 'span');


        $login = new Zend_Form_Element_Submit('login');
        $login->setLabel('Login >>');


        $login->removeDecorator('DtDdWrapper')
              ->removeDecorator('HtmlTag')
	      ->setAttrib('class', 'u-login');

        $this->setDecorators(array(
            array('ViewScript', array('script' => 'login.phtml'))
        ));

	    $this->addElements(array($username, $password, $remember, $login));
    }
}
