<?php

	class AdminRepository extends model {

		// This mehtod get an admin by email and password
        public function get($email, $password) {
            $sql = $this->db->prepare("SELECT * FROM admin WHERE email = :email AND password = :password");
			$sql->bindValue(":email", $email);
			$sql->bindValue(":password", $password);
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql->fetch(PDO::FETCH_ASSOC);
			}

			return null;
		}

    }

?>