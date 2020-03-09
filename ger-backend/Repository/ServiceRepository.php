<?php

	// This class is responsible for accessing the database
	// using SQL statements
	class ServiceRepository extends model {

		// This method get a service by id
		public function get($id) {
			$sql = $this->db->prepare("SELECT * FROM services s
				INNER JOIN vehicles v ON v.id = s.idVehicle
				LEFT JOIN employees e ON e.id = s.idEmployee
				WHERE s.id = :id");

			$sql->bindValue(":id", $id);
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql->fetch(PDO::FETCH_ASSOC);
			}

			return null;
        }

		// This method gets a user by id and returns
		// id, status, date, idEmployee and license
		public function getByUserId($userId) {
			$sql = $this->db->prepare("SELECT s.id, s.status, s.date, s.idEmployee, v.license FROM services s 
				INNER JOIN vehicles v ON v.id = s.idVehicle
				LEFT JOIN employees e ON e.id = s.idEmployee
				WHERE s.idCustomer = :userId");
				
			$sql->bindValue(":userId", $userId);
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql->fetchAll(PDO::FETCH_ASSOC);
			}

			return null;
		}

		// This method is used to register a service receiving
		// typeService, idCustomer, idVehicle, date
		public function register(
				string $typeService,
				string $idCustomer,
				string $idVehicle,
				string $date) {

			$sql = $this->db->prepare("INSERT INTO services SET  typeService = :typeService, idCustomer = :idCustomer, idVehicle = :idVehicle, date = :date, status = :status");
			
			$sql->bindValue(":typeService", $typeService);
            $sql->bindValue(":idCustomer", $idCustomer);
			$sql->bindValue(":idVehicle", $idVehicle);
			$sql->bindValue(":date", $date);
            $sql->bindValue(":status", "Booked");

			if ($sql->execute()) {
				return $this -> db -> lastInsertId();
			}

			return false;
		}
		
		// This function gets a service by date
		public function getByDate($date) {
            $sql = $this -> db -> prepare("SELECT * FROM services WHERE date= :date");
            $sql -> bindValue(":date", $date);
            $sql -> execute();
 
			return $sql -> fetchAll(PDO::FETCH_ASSOC);
		}
		
		// This function returns quantity of services registered on a specific date
		public function getCountByDate($date) {
            $sql = $this->db->prepare("SELECT COUNT(*) FROM services WHERE date = :date");
            $sql->bindValue(":date", $date);
            $sql->execute();
 
            return $sql->fetchColumn();
        }

		// This method updates a service receiving
		// newStatus, serviceId, cost and idEmployee by params
		public function updateService($newStatus, $serviceId, $cost, $idEmployee) {

			$sql = $this -> db -> prepare("UPDATE services SET status = :status , cost = :cost, idEmployee = :idEmployee WHERE id = :serviceId");
			$sql -> bindValue(":status", $newStatus);
			$sql -> bindValue(":serviceId", $serviceId);
			$sql -> bindValue(":cost", $cost);
			$sql -> bindValue(":idEmployee", $idEmployee);

			if ($sql -> execute()) {
				return true;
			}

			return false;
		}
	}

?>
