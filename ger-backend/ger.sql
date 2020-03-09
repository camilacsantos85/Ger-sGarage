-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Mar-2020 às 16:52
-- Versão do servidor: 5.7.29-log
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ger`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `name`) VALUES
(1, 'mcruz', 'mcruz', 'Matheus');

-- --------------------------------------------------------

--
-- Estrutura da tabela `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `cel`) VALUES
(12, 'Alerson Martins', 'alerson@email.com', '202cb962ac59075b964b07152d234b70', '21981580771');

-- --------------------------------------------------------

--
-- Estrutura da tabela `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cel` varchar(255) NOT NULL,
  `post` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` double NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `typeService` varchar(255) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `idVehicle` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `service_products`
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
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` tinyint(4) NOT NULL,
  `session` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sessions`
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
-- Estrutura da tabela `users`
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
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `password`) VALUES
(8, 'ok', 'ok', 'ok', 'admin', 'ok'),
(17, 'd', 'd', 'dd', 'employee', 'ger123'),
(18, 'aaa', 'aaa', 'aaa', 'employee', 'ger123'),
(19, 'ff', 'ff', 'ff', 'employee', 'ger123'),
(20, 'few', 'fwe', 'few', 'employee', 'ger123'),
(21, 'dsadsa', 'dsadsa', 'dsadsa', 'employee', 'ger123'),
(23, 'dd', 'sssaas', 'saaas', 'employee', 'ger123'),
(24, 'dddwq', 'qwqwdw', 'wq', 'employee', 'ger123'),
(25, 'dqdwqdwqw', 'wwww', 'www', 'employee', 'ger123'),
(26, 'a', 'a', 'aaa', 'employee', 'ger123'),
(27, 'dsadsa', 'dsadggghhh', 'fewe', 'employee', 'ger123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vehicles`
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
-- Extraindo dados da tabela `vehicles`
--

INSERT INTO `vehicles` (`id`, `userId`, `type`, `brand`, `license`, `motor`) VALUES
(2, 8, 'BUS', 'dwqdwq', 'dwqdwqdwq', 'ELETRIC'),
(3, 8, 'VAN', 'dwqdwq', 'dwqdwq', 'ELETRIC'),
(4, 8, 'CAR', 'dwqdwq', 'dwqdwqd', 'ELETRIC'),
(5, 8, 'VAN', 'dwqdwq', 'dwqdwq', 'ELETRIC'),
(6, 8, 'VAN', 'dwqdwq', 'dwqdw', 'ELETRIC');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `customers`
--
ALTER TABLE `customers`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `employees`
--
ALTER TABLE `employees`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `services`
--
ALTER TABLE `services`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `service_products`
--
ALTER TABLE `service_products`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `vehicles`
--
ALTER TABLE `vehicles`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `service_products`
--
ALTER TABLE `service_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
