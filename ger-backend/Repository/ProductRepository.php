<?php

	class ProductRepository extends model {

		// This method gets all products
        public function get() {
			$sql = $this->db->prepare("SELECT * FROM products");
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql->fetchAll(PDO::FETCH_ASSOC);
			}

			return null;
        }

		// This method gets a product by id
		// params: { id: int }
        public function getById($id) {
            $sql = $this->db->prepare("SELECT * FROM products WHERE id = :id");
            $sql->bindValue(":id", $id);
			$sql->execute();

			if ($sql->rowCount() > 0) {
				return $sql->fetch(PDO::FETCH_ASSOC);
			}

			return null;
        }

		// This method register a product
		// params: { name: string, cost: float, desciption: string }
        public function register($name, $cost, $description) {
            $sql = $this->db->prepare("INSERT INTO products SET name = :name, cost = :cost, description = :description");
            $sql->bindValue(":name", $name);
            $sql->bindValue(":cost", $cost);
			$sql->bindValue(":description", $description);

			if ($sql->execute()) {
				return $this->db->lastInsertId();
			}

			return false;
        }
		
		// This method updates a product
		// params: { productId: int, name: string, cost: float, description: string }
        public function update($productId, $name, $cost, $description) {
            $sql = $this->db->prepare("UPDATE products SET name = :name, cost = :cost, description = :description WHERE id = :productId");
            $sql->bindValue(":name", $name);
            $sql->bindValue(":cost", $cost);
			$sql->bindValue(":description", $description);
			$sql->bindValue(":productId", $productId);

			if ($sql->execute()) {
				return true;
			}

			return false;
		}
    }

?>