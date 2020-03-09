-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2020 at 12:01 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ger`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`) VALUES
(1, 'Mark Smith', '+353 99999-9999'),
(2, 'John Davis', '+353 88888-8888'),
(3, 'Jose Rodriguez', '+353 77777-7777'),
(5, 'Anna Lee', '+353 66666-6666');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` double NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `cost`, `description`) VALUES
(1, 'A/C Clutch', 53.38, 'Description 1'),
(2, 'A/C Compressor', 200, 'Description 2'),
(3, 'A/C Condenser', 98.99, 'Description 3'),
(4, 'Air filter', 20, 'Description 4'),
(5, 'Airbag sensors', 410, 'Description 5'),
(6, 'Alternator', 300, 'Description 6'),
(7, 'Battery', 69.37, 'Description 7'),
(8, 'Brake pedal', 8, 'Description 8'),
(9, 'Brake piston', 15.95, 'Description 9'),
(10, 'Brake pump', 41.7, 'Description 10'),
(11, 'Carburetor', 200, 'Description 11'),
(12, 'Carpet', 120, 'Description 12'),
(13, 'Clutch', 436.49, 'Description 13'),
(14, 'Disk break', 26.49, 'Description 14'),
(15, 'Door handle', 33.52, 'Description 15'),
(16, 'Door switch', 5, 'Description 16'),
(17, 'Front Left Side Door Glass', 120, 'Description 17'),
(18, 'Front Right Side Door Glass', 120, 'Description 18'),
(19, 'Fuel distributor', 349, 'Description 19'),
(20, 'Fuel filter', 80, 'Description 20'),
(21, 'Gear', 300, 'Description 21'),
(22, 'Hand brake', 150, 'Description 22'),
(23, 'Horn', 19.5, 'Description 23'),
(24, 'Ignition switch', 98.5, 'Description 24'),
(25, 'Oil filter', 50, 'Description 25'),
(26, 'Radiator', 499.99, 'Description 26'),
(27, 'Rear Left Side Door Glass', 120, 'Description 27'),
(28, 'Rear Right Side Door Glass', 120, 'Description 28'),
(29, 'Rear-view mirror', 118.99, 'Description 29'),
(30, 'Seat', 200, 'Description 30'),
(31, 'Seat belt', 50, 'Description 31'),
(32, 'Sparking cable', 184, 'Description 32'),
(33, 'Steering wheel', 45, 'Description 33'),
(34, 'Tail lights', 98.99, 'Description 34'),
(35, 'Trunk', 162, 'Description 35'),
(36, 'Tyre', 56.91, 'Description 36'),
(37, 'Water tank', 130, 'Description 37'),
(38, 'Wheel', 732, 'Description 38'),
(39, 'Windscreen', 200, 'Description 39'),
(40, 'Windscreen wipers', 28.99, 'Description 40');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `typeService` varchar(255) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `idEmployee` int(11) DEFAULT NULL,
  `idVehicle` int(11) NOT NULL,
  `date` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `cost` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_products`
--

CREATE TABLE `service_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serviceId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` tinyint(4) NOT NULL,
  `session` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `session`, `role`, `status`) VALUES
(12, 1, 'b06a97b8fac1153a11053d5a27b78088', 'admin', 1),
(13, 1, 'a559bdeb7dc30c24d35783ceb82254a3', 'admin', 1),
(14, 1, 'f742b37af83a2b54056cde3dcc38e8ee', 'admin', 1),
(15, 1, '55b566f0d08c92f5909af7ef08e2db37', 'admin', 1),
(16, 1, '011a2b3b73c7f009dbeefd9bb6996273', 'admin', 1),
(17, 1, 'c4cc0ccffb34e5c83495c2edc372c435', 'admin', 1),
(18, 1, 'f161d03c719dbc93e184f35873c5543c', 'admin', 1),
(19, 1, '4906c7447be4a85cd25c34392a8e3290', 'admin', 1),
(20, 1, 'c2c04501c1d37ad63505818c8b2299f1', 'admin', 1),
(21, 1, '8df0055e130301ee3d6c21c42e1fc32f', 'admin', 1),
(22, 1, '40b37b043c52404644a405c93f8fd02b', 'admin', 1),
(23, 1, '40b37b043c52404644a405c93f8fd02b', 'admin', 1),
(24, 1, '1f67f8dc6953345d8e7bf310ec1bf508', 'admin', 1),
(25, 1, '1f67f8dc6953345d8e7bf310ec1bf508', 'admin', 1),
(26, 1, '1f67f8dc6953345d8e7bf310ec1bf508', 'admin', 1),
(27, 1, 'd862945c2112da0d2f5f1d18ba2c4212', 'admin', 1),
(28, 1, '9cdb618649218e3f6e1558824e94dbe5', 'admin', 1),
(29, 1, '39dfa1c3f49e7d1fb50643575d8a71bb', 'admin', 1),
(30, 1, 'fae2e82c99382a5e562c8c0586b681f9', 'admin', 1),
(31, 1, 'fae2e82c99382a5e562c8c0586b681f9', 'admin', 1),
(32, 1, '4acde2b033eba35aa836dab7d72b5a19', 'admin', 1),
(33, 1, 'c7e90c75935eaea46ebcf73e10936bbc', 'admin', 1),
(34, 1, '5d6fe72a3e90a11625d7d06693100b49', 'admin', 1),
(35, 1, '01bdc260a08f1b93ce6b02d8d0fc1f27', 'admin', 1),
(36, 1, '2040f779b52189c404e26e33161fc0ba', 'admin', 1),
(37, 1, '546d1634ec70826a5bd1d41cd1744cc6', 'admin', 1),
(38, 1, 'd0cedb18e87439afba60b611d3989778', 'admin', 1),
(39, 1, 'b5abf40cbba3806021484506cd6ceab8', 'admin', 1),
(40, 1, 'afa994d90a948fd3b0e37a7107a332c8', 'admin', 1),
(41, 1, 'afa994d90a948fd3b0e37a7107a332c8', 'admin', 1),
(42, 1, 'afa994d90a948fd3b0e37a7107a332c8', 'admin', 1),
(43, 1, '0d0367ff3406b5b2c2db494754082428', 'admin', 1),
(44, 1, '291e24b1164ddffc1c74bc44afc94b21', 'admin', 1),
(45, 1, '6073a85f78344b90a6f4154fe22d6d31', 'admin', 1),
(46, 1, '5ac1addf786a6d8934daf1fc2296d103', 'admin', 1),
(47, 1, '059097a8f70bc599b7386fd2cc283fe8', 'admin', 1),
(48, 1, 'e87173dfc6d1630d29ef94b924c8e49d', 'admin', 1),
(49, 1, '3c77cb8620ba68d1e19099a5dd8759ff', 'admin', 1),
(50, 1, '5dd5ba9ced3ce91c80c3f2a3379295c2', 'admin', 1),
(51, 1, '5b0fc077a6948cf21e7afabb06cf988a', 'admin', 1),
(52, 1, 'a6a21f348320427302faf80c5444000d', 'admin', 1),
(53, 1, 'c81a9dd570f9c5e013d9fdd6cdfc83d7', 'admin', 1),
(54, 1, '24e67c90da407fb817cb214f151cb6d9', 'admin', 1),
(55, 8, '3fd583fcbb80c2e5978db857d44445ee', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `password`) VALUES
(1, 'admin', 'admin@cct.ie', '8888888888', 'admin', '1234'),
(28, 'Camila', 'camila.cerqueira@gmail.com', '+353899677241', 'customer', '123'),
(31, 'Anna ', 'anna@info.com', '0899999999', 'customer', '123');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` tinyint(4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `motor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `service_products`
--
ALTER TABLE `service_products`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `service_products`
--
ALTER TABLE `service_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
