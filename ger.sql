-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2020 at 12:05 AM
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
