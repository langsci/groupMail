<?php

/**
 * @file plugins/generic/groupMail/GroupMailPlugin.inc.php
 *
 * Copyright (c) 2016 Language Science Press
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class GroupMailPlugin
 *
 */

import('lib.pkp.classes.plugins.GenericPlugin');

class GroupMailPlugin extends GenericPlugin {


	function register($category, $path) {
			
		if (parent::register($category, $path)) {
			$this->addLocaleData();
			
			if ($this->getEnabled()) {
				HookRegistry::register('LoadHandler', array(&$this, 'handleLoadRequest'));
			}
			return true;
		}
		return false;

	}

	function handleLoadRequest($hookName, $args) {

		$request = $this->getRequest();
		$press   = $request->getPress();		

		// get url path components to overwrite them 
		$pageUrl =& $args[0];
		$opUrl =& $args[1];

		// get path components
		$urlArray = array();
		$urlArray[] = $args[0];
		$urlArray[] = $args[1];
		$urlArray = array_merge($urlArray,$request->getRequestedArgs());
		$urlArrayLength = sizeof($urlArray);

		// get path components specified in the plugin settings
		$settingPath = $this->getSetting($press->getId(), 'path');
		if (!ctype_alpha(substr($settingPath,0,1))&&!ctype_digit(substr($settingPath,0,1))) {
			return false;
		}
		$settingPathArray = explode("/",$settingPath);
		$settingPathArrayLength = sizeof($settingPathArray);
		if ($settingPathArrayLength==1) {
			$settingPathArray[] = 'index';
		}

		// compare path and path settings
		$goToGroupMail = false;
		if ($settingPathArray==$urlArray ||
			end($urlArray)=='getGroupMailResults' ||
			($urlArray[0]=='getGroupMailResults'&&$urlArray[1]=='index')){

			$goToGroupMail = true;
		}

		if ($goToGroupMail) {

			$pageUrl = '';
			$opUrl = 'getGroupMailResults';
			if ($settingPathArray==$urlArray) {
				$opUrl = 'viewGroupMail';
			}

			define('HANDLER_CLASS', 'GroupMailHandler');
			define('GROUPMAIL_PLUGIN_NAME', $this->getName());

			$this->import('GroupMailHandler');

			return true;




			define('HANDLER_CLASS', 'GroupMailHandler');
			define('GROUPMAIL_PLUGIN_NAME', $this->getName());
			$this->import('GroupMailHandler');
			GroupMailHandler::setPlugin($this);
			return true;
		}
		return false;
	}

	/**
	 * @see Plugin::getActions()
	 */
	function getActions($request, $verb) {
		$router = $request->getRouter();
		import('lib.pkp.classes.linkAction.request.AjaxModal');
		return array_merge(
			$this->getEnabled()?array(
				new LinkAction(
					'settings',
					new AjaxModal(
						$router->url($request, null, null, 'manage', null, array('verb' => 'settings', 'plugin' => $this->getName(), 'category' => 'generic')),
						$this->getDisplayName()
					),
					__('manager.plugins.settings'),
					null
				),
			):array(),
			parent::getActions($request, $verb)
		);
	}

 	/**
	 * @see Plugin::manage()
	 */
	function manage($args, $request) {
		switch ($request->getUserVar('verb')) {
			case 'settings':
				$context = $request->getContext();
				$this->import('SettingsForm');
				$form = new SettingsForm($this, $context->getId());

				if ($request->getUserVar('save')) {
					$form->readInputData();
					if ($form->validate()) {
						$form->execute();
						return new JSONMessage(true);
					}
				} else {
					$form->initData();
				}
				return new JSONMessage(true, $form->fetch($request));
		}
		return parent::manage($args, $request);
	}

	function getDisplayName() {
		return __('plugins.generic.groupMail.displayName');
	}

	function getDescription() {
		return __('plugins.generic.groupMail.description');
	}

	function getTemplatePath($inCore = false) {
		return parent::getTemplatePath() . 'templates/';
	}
}

?>
