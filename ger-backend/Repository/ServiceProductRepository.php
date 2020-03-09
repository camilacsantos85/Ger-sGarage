<?php

	class ServiceProductRepository extends model {

		// This method populate the relational table between service and product
		// params : { serviceId: int, productId: int, quantity: int, cost: float }
        public function add($serviceId, $productId, $quantity, $cost) {
            $sql = $this->db->prepare("INSERT INTO service_products SET serviceId = :serviceId, productId = :productId, quantity = :quantity, cost = :cost");
            $sql->bindValue(":serviceId", $serviceId);
			$sql->bindValue(":productId", $productId);
			$sql->bindValue(":quantity", $quantity);
            $sql->bindValue(":cost", $cost);

			if ($sql->execute()) {
				return $this->db->lastInsertId();
			}

			return false;
		}
		
		// This method gets a service_products rows by service id
		// params: { serviceId: int }
		public function getByServiceId($serviceId) {

			$sql = $this -> db -> prepare("SELECT * FROM service_products sp WHERE sp.serviceId = :serviceId");
			$sql -> bindValue(":serviceId", $serviceId);
			
			$sql -> execute();
			if ($sql -> rowCount() > 0) {
				return $sql -> fetchAll(PDO::FETCH_ASSOC);
			}
	
			return null;
		}
	}
?>