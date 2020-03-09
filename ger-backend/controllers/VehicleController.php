<?php
    require(__DIR__."\..\Repository\VehicleRepository.php");

	class VehicleController extends controller {

        // This method is used to register a vehicle
        // POST /Vehicle/Register
        // data: { type, brand, license, motor, userId }
        public function register() {

            $type = $_POST['type'];
            $brand = $_POST['brand'];
            $license = $_POST['license'];
            $motor = $_POST['motor'];
            $userId = $_POST['userId'];
                     

            $vehicleRepository = new VehicleRepository();
            $vehicleRepository -> register($userId, $type, $brand, $license, $motor);

            if ($vehicleRepository) {
                http_response_code(201);
            } else {
                http_response_code(404);
            }
        }

        // This method is used to get a vehicle by id
        // GET /Vehicle/GetByUser
        // data: { userId }
        public function getByUser() {

            $userId = $_GET["userId"];

            $vehicleRepository = new VehicleRepository();

            $vehicles = $vehicleRepository -> getByUserId($userId);
            
            echo json_encode($vehicles);
        }
	}
?>