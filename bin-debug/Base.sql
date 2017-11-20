-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2017 at 01:52 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `contabilidad`
--

-- --------------------------------------------------------

--
-- Table structure for table `compromiso`
--

CREATE TABLE `compromiso` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `monto` int(11) NOT NULL,
  `cuotas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movimiento`
--

CREATE TABLE `movimiento` (
  `id` int(11) NOT NULL,
  `tipo_movimiento` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_documento` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `nro_doc` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fuente_financiera` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `monto` int(11) NOT NULL,
  `cod_cuenta` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `cod_contable` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fec_mvto` date NOT NULL,
  `fec_ing` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `rut` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `codigo` varchar(2) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `descripcion`, `codigo`) VALUES
(1, 'Factura Simple', 'FS'),
(2, 'Factura Electrónica', 'FE'),
(3, 'Boleta Simple', 'BS'),
(4, ' Boleta Electrónica', 'BE'),
(5, 'Honorario Simple', 'HS'),
(6, 'Honorario  Electrónico', 'HE'),
(7, 'Recibo', 'R'),
(8, 'Tranfer', 'T'),
(9, 'Vale', 'V'),
(10, 'Otro', 'O');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compromiso`
--
ALTER TABLE `compromiso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compromiso`
--
ALTER TABLE `compromiso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;
