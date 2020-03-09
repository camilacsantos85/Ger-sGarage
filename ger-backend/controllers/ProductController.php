<?php

    require(__DIR__."\..\Repository\ProductRepository.php");

    class ProductController extends controller {

        // GET /Product/Get
        public function get() {
            $productRepository = new ProductRepository();
            /** Get all products from repository */
            $products = $productRepository->get();

            /** Return products */
            echo json_encode($products);
        }

        // POST Product/Register
        public function register() {
            /** Get Post Parameters */
            $name = $_POST['name'];
            $cost = $_POST['cost'];
            $description = $_POST['description'];

            $productRepository = new ProductRepository();
            $productId = $productRepository->register($name, $cost, $description);
        }

        // PUT /Product/Update/{productId}
        // data: { name, cost, description }
        public function update($productId) {
            /** Get Put Parameters */
            $name = $_PUT['name'];
            $cost = $_PUT['cost'];
            $description = $_PUT['description'];

            $productRepository = new ProductRepository();
            $update = $productRepository->update($productId, $name, $cost, $description);

            if ($update) {
                /** Return a success message if product has updated successfully */
                echo "Product successfully changed"; exit;
            }

            /** Return a error message if product not has updated */
            throw new error("Error when changing the product");
        }

    }

?>