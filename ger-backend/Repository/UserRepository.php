<?php
    class UserRepository extends model {

        // This method is used to insert an user into users table
        // params: { name: string, email: string, phone: string, role: string, password: string }
        public function insert(
            string $name,
            string $email,
            string $phone,
            string $role,
            string $password) {

                $sql = $this -> db -> prepare(
                    "INSERT INTO users SET name = :name, email = :email, phone = :phone, role = :role, password = :password"
                );

                $sql -> bindValue(":name", addslashes($name));
                $sql -> bindValue(":email", addslashes($email));
                $sql -> bindValue(":phone", addslashes($phone));
                $sql -> bindValue(":role", addslashes($role));
                $sql -> bindValue(":password", addslashes($password));

                if ($sql -> execute()) {
                    
                    return $this -> db -> lastInsertId();
                }

                return false;
        }

        // This method gets a user by email
        // params: { email: string }
        public function getByEmail(string $email) {

            $sql = $this -> db -> prepare("SELECT * FROM users WHERE email = :email");
			$sql -> bindValue(":email", $email);
			
			$sql -> execute();

			if ($sql -> rowCount() > 0) {
				return $sql -> fetch(PDO::FETCH_ASSOC);
			}

			return null;
        }

        // This method gets an user by id
        // params: { id: int }
        public function getById($id) {

            $sql = $this -> db -> prepare("SELECT * FROM users WHERE id = :id");
			$sql -> bindValue(":id", $id);
			
			$sql -> execute();

			if ($sql -> rowCount() > 0) {
				return $sql -> fetch(PDO::FETCH_ASSOC);
			}

			return null;
        }
        
        // This method gets a users list by role
        // params: { role: string }
        public function getByRole(string $role) {

            $sql = $this ->db -> prepare("SELECT * FROM users WHERE role = :role");
            $sql -> bindValue(":role", $role);

			$sql -> execute();

			if ($sql -> rowCount() > 0) {
				return $sql->fetchAll(PDO::FETCH_ASSOC);
			}
			return null;
        }
    }
?>