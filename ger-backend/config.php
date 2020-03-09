
<?php
	// This is a database configuration file

	 // Load the environment
	require 'environment.php';

	$config = array();

	if (ENVIRONMENT == 'development') {
		define("BASE_URL", "http://127.0.0.1:8080/ger/");
		$config['dbname'] = 'ger';
		$config['host']   = 'localhost';
		$config['dbuser'] = 'root';
		$config['dbpass'] = '';
	}

	global $db;

	try {
		$db = new PDO("mysql:dbname=".$config['dbname'].";host=".$config['host'], $config['dbuser'], $config['dbpass']);
	} catch (PDOException $e) {
		echo "Erro: ".$e->getMessage();
	}

?>