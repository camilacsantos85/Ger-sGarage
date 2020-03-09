<?php

	class CustomerRepository extends model {

		// This method get a customer by email and password
		// params: { email: string, password: string }
		public function getCustomerByEmailAndPassword($email, $password) {
			$sql = $this->db->prepare("SELECT * FROM customers WHERE email = :email AND password = :password");
			$sql->bindValue(":email", $email);
			$sql->bindValue(":password", $password);
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql->fetch(PDO::FETCH_ASSOC);
			}

			return null;
		}

		// This method insert a customer 
		// params: { name: string, email: string, password: string, cel: string}
		public function insert(string $name, string $email, string $password, string $cel) {
            $sql = $this->db->prepare("INSERT INTO customers SET name = :name, email = :email, password = :password, cel = :cel");
			$sql->bindValue(":name", addslashes($name));
			$sql->bindValue(":email", addslashes($email));
            $sql->bindValue(":password", md5(addslashes($password)));
            $sql->bindValue(":cel", addslashes($cel));

			if ($sql->execute()) {
				return $this->db->lastInsertId();
			}

			return false;
        }
        
	}

?>