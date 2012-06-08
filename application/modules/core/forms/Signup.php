<?php

class Core_Form_Signup extends Zend_Form
{
    public function __construct()
    {
        parent::__construct();
        $this->_setupElements();
    }

    private  function _setupElements()
    {
        $translate = Zend_Registry::get('Zend_Translate');

        $this->setAttrib('id', 'signupForm');
	    $this->setTranslator($translate);

        $email = new Zend_Form_Element_Text('email');
        $email->setRequired(true)
              ->addFilter('StringTrim')
              ->addFilter('StripTags')
              ->addValidator('NotEmpty')
              ->removeDecorator('HtmlTag')
              ->removeDecorator('DtDWrapper')
              ->removeDecorator('label')
              ->setAttrib('id', 'email')
              ->addValidator('EmailAddress');

        $email->addValidator(new Ziown_Form_Validate_EmailAddress(), false);
        $email->getValidator('NotEmpty')->setMessage('Email Address is Required', 'isEmpty');
        


    	$username = new Zend_Form_Element_Text('username');
    	$username->setRequired(true)
              ->addFilter('StringTrim')
              ->addFilter('StripTags')
              ->addValidator('NotEmpty')
              ->removeDecorator('HtmlTag')
              ->removeDecorator('DtDWrapper')
              ->removeDecorator('label')
              ->setAttrib('id', 'username');

        $username->addValidator(new Ziown_Form_Validate_UserName());
        $username->getValidator('NotEmpty')->setMessage('User name is Required', 'isEmpty');

    	$password = new Zend_Form_Element_Password('password');
    	$password->setRequired(true)
                ->removeDecorator('HtmlTag')
                ->removeDecorator('DtDWrapper')
                ->removeDecorator('label')
                ->setAttrib('id', 'txt-password')
                ->setErrorMessages(array('Password is required'));


       $identValidator = new Zend_Validate_Identical($_POST['password']);
       $identValidator->setMessages(array('notSame' => 'Password doesn\'t match!',
                                       'missingToken' => 'Password doesn\'t match!'));


       $confirm_password   =  new Zend_Form_Element_Password('confirm_password');
       $confirm_password  -> setRequired(true)
                  ->removeDecorator('HtmlTag')
                  ->removeDecorator('DtDWrapper')
                  ->removeDecorator('label')
                  -> setAttrib('id', 'txt-confirm-password')
                  ->addValidator($identValidator);



        $signup = new Zend_Form_Element_Submit('signup');
        $signup->setLabel('Sign Up');


        $signup->removeDecorator('DtDdWrapper')
              ->removeDecorator('HtmlTag')
	      ->setAttrib('class', 'u-login');

        $this->setDecorators(array(
            array('ViewScript', array('script' => 'signup.phtml'))
        ));

	    $this->addElements(array($username, $password, $confirm_password, $signup, $email));
    }
}
