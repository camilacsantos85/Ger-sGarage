<?php

    require(__DIR__."\..\Repository\UserRepository.php");

	class AuthController extends controller {

        // This function is responsible for authenticating the user
        // POST Auth/Login
        // data: { email, password }
        public function login()  {
            $email = $_POST["email"];
            $password = $_POST["password"];

            $userRepository = new UserRepository();
            $user = $userRepository -> getByEmail($email);

            if ($user == null) {
                http_response_code(401); exit;
            } 
            
            if ($user["password"] == $password)  {
                $user["password"] = "";
                echo json_encode($user); exit;
            }

            http_response_code(401);
        }

	}
?>
