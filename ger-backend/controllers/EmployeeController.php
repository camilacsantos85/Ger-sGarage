<?php
    require(__DIR__."\..\Repository\EmployeeRepository.php");

	class EmployeeController extends controller {

        // Get all employees in database
        // GET Employee/GetEmployees
        public function getEmployees() {
            $employeeRepository = new EmployeeRepository();
            $employees = $employeeRepository->get();

            echo json_encode($employees);
        }

        // Thi method register an employee
        // POST /Employee/RegisterEmployee
        // data: { name, phone }
        public function registerEmployee() {
            $name = $_POST['name'];
            $phone = $_POST['phone'];

            $employeeRepository = new EmployeeRepository();
            
            $employeId = $employeeRepository->insert($name, $phone);

            if ($employeId == null) {
                http_response_code(401);
            } else {
                http_response_code(201);
            }

            echo json_encode($employeId);
        }

	}
?>
