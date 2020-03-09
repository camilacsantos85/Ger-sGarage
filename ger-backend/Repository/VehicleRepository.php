<?php

	class VehicleRepository extends model {

        // This method is used to insert an vehicle into vehicles table
        // params: { userId: int, type: string, brand: string, license: string, motor: string }
		public function register($userId, $type, $brand, $licence, $motor) {
            $sql = $this->db->prepare("INSERT INTO vehicles SET userId = :userId, type = :type, brand = :brand, license = :licence, motor = :motor");
            $sql->bindValue(":userId", $userId);
            $sql->bindValue(":type", $type);
            $sql->bindValue(":brand", $brand);
            $sql->bindValue(":licence", $licence);
            $sql->bindValue(":motor", $motor);

			if ($sql->execute()) {
				return true;
			}

			return false;
        }

        
        // This method gets a vehicle list by userId
        // params: { userId: string }
        public function getByUserId(string $userId) {
            
            $sql = $this -> db -> prepare("SELECT * FROM vehicles WHERE userId = :userId");
			$sql -> bindValue(":userId", $userId);
			$sql -> execute();

			if ($sql -> rowCount() > 0) {

                return $sql -> fetchAll(PDO::FETCH_ASSOC);
                
            } 
            
            return null;
        }
	}

?>