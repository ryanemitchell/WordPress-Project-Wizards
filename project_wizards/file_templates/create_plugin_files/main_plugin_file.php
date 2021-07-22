<?php

/*
Plugin Name: [pluginName]
Plugin URI: https://witdelivers.com
Description: [pluginShortDescription]
Version: 0.0.1
Author: [pluginAuthor]
Text Domain: [pluginTextDomain]
*/

/*  ==========================================================================
	Check for composer and load it or disable the plugin
	========================================================================== */

if (file_exists(plugin_dir_path(__FILE__).'/vendor/autoload.php')) {
	require plugin_dir_path(__FILE__).'/vendor/autoload.php';
} else {

	function deactivate_plugin_conditional() {

		deactivate_plugins( plugin_dir_path(__FILE__).'index.php' );

		echo '
			<div class="notice notice-error is-dismissible">
	             <p>There was an error activating this plugin. Please contact your sites administrator.</br>Missing autoloader <code>composer install</code></p>
	         
			</div>';


	}
	add_action( 'admin_init', 'deactivate_plugin_conditional' );

}

/* ==========================================================================
   Include ACF Pro if not ACF does not already exist on the site
   ========================================================================== */
if( ! class_exists('ACF') ) :
	if (file_exists(plugin_dir_path(__FILE__).'vendor/advanced-custom-fields/advanced-custom-fields-pro/acf.php')) :
		require plugin_dir_path(__FILE__).'/vendor/advanced-custom-fields/advanced-custom-fields-pro/acf.php';
	endif;
endif;
/* ==========================================================================
   Plugin Updater
   ========================================================================== */

$MyUpdateChecker = Puc_v4_Factory::buildUpdateChecker(
	'https://plugins.witdigital.com/wp-update-server/?action=get_metadata&slug=[pluginFolderName]', //Metadata URL.
	__FILE__, //Full path to the main plugin file.
	'[pluginSlug]' //Plugin slug. Usually it's the same as the name of the directory.
);
