<?php

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\FixtureInterface;

use Entity\Template;

class LoadTemplateData implements FixtureInterface {

    private $_em;
    public function __construct()
    {
        $this->_em = Zend_Registry::get('em');
        $this->load($this->_em);
//        $this->load();
    }
    
    public function load(ObjectManager $manager) {
//      public function load() {
        $template = new Entity\Template();
        
        $template->setName("Arnob Saha");
        $template->setType("Alert");
        $template->setLanguage("English");
        $template->setDescription("Test test");
        $template->setStatus("1");
        $template->setIsDefault("0");
        $template->setSortOrder("2");
        //var_dump($template);exit;
        $this->_em->persist($template);
        $this->_em->flush();
    }

}
?>
