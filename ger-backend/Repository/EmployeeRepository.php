<?php
	class EmployeeRepository extends model {

		// This method gets all employees
		public function get() {
			$sql = $this->db->prepare("SELECT * FROM employees");
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql->fetchAll(PDO::FETCH_ASSOC);
			}

			return null;
        }
		
		// This method gets an employee by id
		// params: { id: int }
        public function getById($id) {
            $sql = $this->db->prepare("SELECT * FROM employees WHERE id = :id");
            $sql->bindValue(":id", $id);
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql -> fetch(PDO::FETCH_ASSOC);
			}

			return null;
		}

		// This method inserts an employee into database
		// params: { name: string, phone: string }
		public function insert(string $name, string $phone) {
            $sql = $this->db->prepare("INSERT INTO employees SET name = :name, phone = :phone");
			$sql->bindValue(":name", addslashes($name));
            $sql->bindValue(":phone", addslashes($phone));

			if ($sql->execute()) {
				return $this->db->lastInsertId();
			}

			return false;
        }
	}

?>