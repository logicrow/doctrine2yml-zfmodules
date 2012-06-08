<?php

class Core_ErrorController extends Zend_Controller_Action
{
    public function errorAction()
    {
        $errors = $this->_getParam('error_handler');

        switch ($errors->type) {

            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ROUTE:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:

                // 404 error -- controller or action not found
                $this->getResponse()->setHttpResponseCode(404);
                $this->view->message = 'Page not found';
                break;

            default:
                // application error
                $this->getResponse()->setHttpResponseCode(500);
                $this->view->message = 'Application error';
                break;
        }

        // Log exception, if logger available
        if ($log = $this->getLog()) {
            $message = $this->getDetailedErrorMessage();
            $log->crit($message);
        }

        // conditionally display exceptions
        if ($this->getInvokeArg('displayExceptions') == true) {
            $this->view->exception = $errors->exception;
        }

        $this->view->request = $errors->request;
    }

    public function getLog()
    {
        $bootstrap = $this->getInvokeArg('bootstrap');

        if (!$bootstrap->hasPluginResource('Log')) {
            return false;
        }

        $log = $bootstrap->getResource('Log');
        return $log;
    }

    public function getDetailedErrorMessage()
    {
        $request = $this->getRequest();
        
        $error 	    = $request->getParam('error_handler');
        $module =  ($request->module == null) ? $request->getModuleName() : $request->module;
        $controller = ($request->controller == null) ? $request->getControllerName() : $request->controller;
        $action = ($request->action == null) ? $request->getActionName() : $request->action;
        $class 	    = get_class($error->exception);
        $file = $error->exception->getFile();
        $line = $error->exception->getLine();
        $message    = $error->exception->getMessage();
        $trace = $error->exception->getTraceAsString();
        $uri = $request->getRequestUri();
        $str = <<<MESSAGE

        Uri: $uri\n
        Module: $module\n
        Controller: $controller\n
        Action: $action\n
        Class: $class\n
        File: $file\n
        Line: $line\n
        Message: $message\n
        Trace: $trace\n
MESSAGE;

        return $str;

    }
}