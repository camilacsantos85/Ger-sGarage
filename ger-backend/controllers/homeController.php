<?php

	class HomeController extends controller {

		// Just for get a API response
		// GET /Home/Index
		public function index() {
			echo json_encode("Works");
		}

	}

?>
