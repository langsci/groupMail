Key data
============

- name of the plugin: Group Mail Plugin
- author: Carola Fanselow
- current version: 1.0.0.0
- tested on OMP version: 1.2.0
- github link: https://github.com/langsci/groupMail.git
- community plugin: yes, 1.0.0.0
- date: 2016/10/17

Description
============

This plugin lists and exports groups of user names and email adresses for group mails. Users can be selected by their roles that can be connect with logical and, or and not. 
 
Implementation
================

Hooks
-----
- used hooks: 1

		LoadHandler

New pages
------
- new pages: 1

		[press]/[path to be specified in the plugin settings]

Templates
---------
- templates that replace other templates: 0

- templates that are modified with template hooks: 0

- new/additional templates: 2

		groupMail.tpl
		settings.tpl

Database access, server access
-----------------------------
- reading access to OMP tables: 3

		plugin_settings
		user_group_settings
		user_user_groups

- writing access to OMP tables: 0
- new tables: 0
- nonrecurring server access: no
- recurring server access: no
 
Classes, plugins, external software
-----------------------
- OMP classes used (php): 7
	
		GenericPlugin
		Handler
		DAO
		Form

- OMP classes used (js, jqeury, ajax): 1

		AjaxFormHandler

- necessary plugins: 0
- optional plugins: 0
- use of external software: no
- file upload: no
 
Metrics
--------
- number of files: 13
- lines of code: 965

Settings
--------
- settings: 1

		path to the group mail page

Plugin category
----------
- plugin category: generic

Other
=============
- does using the plugin require special (background)-knowledge?: no
- access restrictions: yes (only admins and press managers)
- adds css: yes




