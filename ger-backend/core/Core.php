<?php

	class Core {

		public function run() {

			$url = '/';
			if (isset($_GET['url'])) {
				$url .= $_GET['url'];
			}

			$url = $this->checkRoutes($url);

			$params = array();

			if (!empty($url) && $url != '/') {

				$url = explode('/', $url);
				array_shift($url);

				$currentController = $url[0].'Controller';
				array_shift($url);

				if (isset($url[0]) && !empty($url[0])) {
					$currentAction = $url[0];
					array_shift($url);
				} else {
					$currentAction = 'index';
				}

				if (count($url) > 0) {
					$params = $url;
				}

				//print_r($url);

			} else {

				$currentController = 'homeController';
				$currentAction = 'index';

			}

			if (!file_exists('controllers/'.$currentController.'.php') || !method_exists($currentController, $currentAction)) {
				$currentController = 'notFoundController';
				$currentAction = 'index';
			}

			$controller = new $currentController();
			call_user_func_array(array($controller, $currentAction), $params);

		}

		public function checkRoutes($url) {

			global $routes;

			foreach ($routes as $rota => $newUrl) {

				// Identifica os argumentos e substitui por regEx
				$pattern = preg_replace('(\{[a-z0-9]{1,}\})', '([a-z0-9-]{1,})', $rota);


				// Faz o match da URL
				if (preg_match('#^('.$pattern.')*$#i', $url, $matches) === 1) {

					array_shift($matches);
					array_shift($matches);

					// Pega todos os argumentos para associa-los 
					$itens = array();

					if (preg_match_all('(\{[a-z0-9]{1,}\})', $rota, $m)) {
						
						$itens = preg_replace('(\{|\})', '', $m[0]);

					}

					// Faz a associação
					$arg = array();

					foreach ($matches as $key => $match) {
						
						$arg[$itens[$key]] = $match;

					}

					// Montando a nova URL
					foreach ($arg as $key => $argValue) {
						
						$newUrl = str_replace(':'.$key, $argValue, $newUrl);

					}


					$url = $newUrl;

					break;

				}

			}

			return $url;

		}

	}

?>