<?php
     require(__DIR__."\..\Repository\UserRepository.php");

     class UserController extends controller {

        // This method is used to register an user
        // POST /User/Register
        // data: { name, email, phone, role, password }
        public function register() {

            $name = $_POST["name"];
            $email = $_POST["email"];
            $phone = $_POST["phone"];
            $role = $_POST["role"];
            $password = $_POST["password"];

            $userRepository = new UserRepository();

            $userId = $userRepository -> insert($name, $email, $phone, $role, $password);

            if ($userId == null) {
                http_response_code(404);
            } else {
                http_response_code(201);
            }
        }

        // This function get a list of users by role
        // GET /User/Role
        // data : { role } 
        // customer or admin
        public function role() {

            $role = $_GET["role"];

            $userRepository = new UserRepository();

            $users = $userRepository -> getByRole($role);

            echo json_encode($users);
        }

        // This function get an by id
        // GET /User/GetById/{id}
        public function getById($id) {
            
            $userRepository = new UserRepository();
            $user = $userRepository -> getById($id);

            echo json_encode($user);
        }
     }
?>