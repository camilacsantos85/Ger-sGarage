<?php
	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Headers: Content-Type');
	session_start();
	
	require 'config.php';
	require 'routers.php';

	spl_autoload_register(function($class){

		if (file_exists('controllers/'.$class.'.php')) {
			require 'controllers/'.$class.'.php';
		} else if (file_exists('models/'.$class.'.php')) {
			require 'models/'.$class.'.php';
		} else if (file_exists('core/'.$class.'.php')) {
			require 'core/'.$class.'.php';
		}

	});

	$core = new Core();
	$core->run();

?>