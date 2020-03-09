<?php
    require(__DIR__."\..\Repository\EmployeeRepository.php");
    require(__DIR__."\..\Repository\CustomerRepository.php");
    require(__DIR__."\..\Repository\ServiceRepository.php");

    
	class ServiceController extends controller {

        // This method is responsible for receiving the server id
        // and returning the object sought by the repository
        // GET /Service/Get/{serviceId} 
        public function get($serviceId) {

            $serviceRepository = new ServiceRepository();
            $service = $serviceRepository->get($serviceId);

            echo json_encode($service);
        }

        // This method is responsible for searching for all services
        // using the client or admin id
        // GET /Service/GetByUser/{userId}
        public function getByUser($userId) {
            $serviceRepository = new ServiceRepository();
            $services = $serviceRepository->getByUserId($userId);

            echo json_encode($services);
        }

        // This method is responsible for updating a service
        // it updates status, cost and emploeeId
        // POST /Service/UpdateService
        // data: { newStatus, serviceId, cost }
        public function updateService() {

            $newStatus = $_POST["newStatus"];
            $serviceId = $_POST["serviceId"];
            $cost = $_POST["cost"];
            $idEmployee = $_POST["idEmployee"];

            $serviceRepository = new ServiceRepository();
            $result = $serviceRepository -> updateService($newStatus, $serviceId, $cost, $idEmployee);

            if ($result) {
                http_response_code(200);
                return "true";
            } else {
                http_response_code(400);
                return "false";
            }
        }

        // This method is used to register a service
        // POST /Service/Register
        // data: { typeService, userId, idVehicle, date }
		public function register() {

            $typeService = $_POST['typeService'];
            $idCustomer = $_POST['userId'];
            $idVehicle = $_POST['idVehicle'];
            $date = $_POST['date'];

            $serviceRepository = new ServiceRepository();

            $servicesCount = $serviceRepository->getCountByDate($date);

            if ($servicesCount > 3) {
                http_response_code(403);
                echo json_encode("Service limit exceeded scheduled for that day"); exit;
            }

            $serviceId = $serviceRepository->register($typeService, $idCustomer, $idVehicle, $date);

            if ($serviceId != null) {
                http_response_code(201);
            }

            echo json_encode($serviceId);
        }
        
        // This method is used to search for all services by the scheduled date
        // GET /Service/GetByDate/{date}
        public function getByDate($date) {

            $serviceRepository = new ServiceRepository();
            $services = $serviceRepository->getByDate($date);

            echo json_encode($services);
        }
	}
?>
