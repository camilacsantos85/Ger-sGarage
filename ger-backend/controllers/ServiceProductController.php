<?php

    require(__DIR__."\..\Repository\ProductRepository.php");
    require(__DIR__."\..\Repository\ServiceProductRepository.php");

    class ServiceProductController extends controller {

        // This method get a service by id
        // GET /ServiceProduct/GetByServiceId/{serviceId}
        public function getByServiceId($serviceId) {

            $serviceProductRepository = new ServiceProductRepository();
            $serviceProduct = $serviceProductRepository -> getByServiceId($serviceId);

            echo json_encode($serviceProduct);
        }

        // This method add a product to service
        // PSOT /ServiceProduct/Add
        // data : { serviceId, productId, quantity }
        public function add() {
            $serviceId = $_POST['serviceId'];
            $productId = $_POST['productId'];
            $quantity = $_POST['quantity'];

            $productRepository = new ProductRepository();
            $product = $productRepository->getById($productId);

            $serviceProductRepository = new ServiceProductRepository();
            $cost = floatval($product['cost']);

            $cost = $cost * floatval($quantity);

            $add = $serviceProductRepository->add($serviceId, $productId, $quantity, $cost);

            if ($add != null) {
                echo "Product added successfully";
            } else {
   
                throw new error("Error when adding the product");
            }
        }

    }

?>