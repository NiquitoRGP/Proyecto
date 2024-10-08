-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2024 a las 00:25:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `armario_futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `talle` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `descripcion` text DEFAULT NULL,
  `talles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`talles`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `imagen`, `disponible`, `descripcion`, `talles`) VALUES
(1, 'Camiseta FC Barcelona', 50.00, 'barcelona.png', 1, NULL, NULL),
(2, 'Camiseta Real Madrid', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', '[\"S\" , \"M\", \"L\", \"XL\"]'),
(3, 'Camiseta Manchester United', 60.00, 'manchester.png', 1, NULL, NULL),
(4, 'Camiseta Seleccion Francesa', 50.00, 'barcelona.png', 1, NULL, NULL),
(5, 'Camiseta River Plate', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(6, 'Camiseta Boca Juniors', 60.00, 'manchester.png', 1, NULL, NULL),
(7, 'Camiseta Seleccion Argentina', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(8, 'Camiseta Seleccion Alemana', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(9, 'Camiseta Seleccion Peruana', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(10, 'Camiseta Seleccion Canadiense', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(11, 'Camiseta Seleccion Española', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(12, 'Camiseta Seleccion Estaounidense', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(13, 'Camiseta Seleccion Brasilera', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(14, 'Camiseta Paris-Saint Germain', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(15, 'Camiseta Tigres', 169999.00, 'madrid.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(16, 'Camiseta Seleccion Mexicana', 169999.00, 'mexico.png', 1, 'Camiseta oficial del Real Madrid.', NULL),
(17, 'Camiseta San Lorenzo', 169999.00, 'san lorenzo.png', 1, 'Camiseta oficial del Real Madrid.', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
