<?php

include_once APPLICATION_PATH . '/modules/core/models/UserManager.php';
/**
 * Ziown
 *
 * 
 * @copyright	Copyright (c) 2010-2011 Westilo Technology Limited(http://www.westilo.com)
 * @author 	    Raju Mazumder<rajuniit@gmail.com>
 */

class Core_Services_Auth implements Zend_Auth_Adapter_Interface 
{
	/**
	 * Authenticated success
	 * Its value must be greater than 0
	 */
	const SUCCESS = 1;
	
	/**
	 * Constant define that user has not been active
	 * Its value must be smaller than 0
	 */
	const NOT_ACTIVE = -1;
	
	/**
	 * General failure
	 * Its value must be smaller than 0
	 */
	const FAILURE = -2;
	
	private $_username;
	private $_password;
	
	public function __construct($username, $password) 
	{
		$this->_username = $username;
		$this->_password = $password;
	}

	/**
     * Performs an authentication attempt
     *
     * @throws Zend_Auth_Adapter_Exception If authentication cannot be performed
     * @return Zend_Auth_Result
     */
    public function authenticate() 
    {    	
		$password = sha1(md5($this->_password));
        
		$userManager = new UserManager();
		$options = array('criteria' => array('username' => $this->_username));
		$user = $userManager->getUserBy($options);
        
		if (null == $user) {
			return new Zend_Auth_Result(self::FAILURE, null);
		}
        if ($user->getPassword() != $password) {
            return new Zend_Auth_Result(self::FAILURE, null);
        }

    	if ($user->getStatus()->getName() != UserManager::USER_ACTIVE) {
    		return new Zend_Auth_Result(self::NOT_ACTIVE, null);
    	}

        if ($user->getPassword() == $password) {
            $object = $this->getIdentityObject($user);
            return new Zend_Auth_Result(self::SUCCESS, $object);
        }


        return new Zend_Auth_Result(self::FAILURE, null);

    }

    private function getIdentityObject($user)
    {
        $object = new stdClass();
        $object->userName = $user->getUserName();
        $object->userId = $user->getId();
        $object->role = $user->getRole()->getName();
        $object->email = $user->getEmail();
        $object->plan = $user->getPlan()->getName();

        return $object;
    }
}
