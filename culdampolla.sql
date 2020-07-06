-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2020 a las 12:50:53
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `culdampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_clients` Aquesta taula te una relació interna entre idClientRecomanacio i idCliente
--

CREATE TABLE `cl_clients` (
  `idCliente` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresaPostal` varchar(100) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `correuElectronic` varchar(100) DEFAULT NULL,
  `dataAlta` date NOT NULL,
  `idClientRecomanacio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cl_clients`
--

INSERT INTO `cl_clients` (`idCliente`, `nom`, `adresaPostal`, `telefon`, `correuElectronic`, `dataAlta`, `idClientRecomanacio`) VALUES
(1, 'Patricia', 'Percebe, 5', '123456789', 'arroba@arroba.com', '2020-07-06', NULL),
(2, 'El corte ingles', 'Barcelona', '987654321', 'corte@ingles.com', '2020-06-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `em_empleats`
--

CREATE TABLE `em_empleats` (
  `idEmpleat` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `em_empleats`
--

INSERT INTO `em_empleats` (`idEmpleat`, `nom`) VALUES
(1, 'Francisco Vicente'),
(2, 'Elisabeth');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gl_tipuscarrer`
--

CREATE TABLE `gl_tipuscarrer` (
  `idTipusCarrer` int(11) NOT NULL,
  `descripcio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gl_tipuscarrer`
--

INSERT INTO `gl_tipuscarrer` (`idTipusCarrer`, `descripcio`) VALUES
(1, 'Carrer'),
(2, 'Avinguda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gn_colors`
--

CREATE TABLE `gn_colors` (
  `idColor` int(11) NOT NULL,
  `descripcio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gn_colors`
--

INSERT INTO `gn_colors` (`idColor`, `descripcio`) VALUES
(1, 'Vermell'),
(2, 'Blanc'),
(3, 'Transparent'),
(4, 'Verd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mq_marques`
--

CREATE TABLE `mq_marques` (
  `idMarca` int(11) NOT NULL,
  `nomMarca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mq_marques`
--

INSERT INTO `mq_marques` (`idMarca`, `nomMarca`) VALUES
(1, 'Oakley'),
(2, 'Rayban');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mq_marquesproveidor` Aquesta taula ens serviria per tenir un historic del proveidors de la marca i podriem saber quin es el proveidor actual
-- comprovant el valor de dataBaixa a null

CREATE TABLE `mq_marquesproveidor` (
  `idMarcaProveidor` int(11) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idProveidor` int(11) NOT NULL,
  `dataAlta` date NOT NULL,
  `dataBaixa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mq_marquesproveidor`
--

INSERT INTO `mq_marquesproveidor` (`idMarcaProveidor`, `idMarca`, `idProveidor`, `dataAlta`, `dataBaixa`) VALUES
(1, 1, 1, '2020-01-01', '2020-04-16'),
(2, 1, 2, '2020-04-17', NULL),
(3, 2, 1, '2020-01-01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pa_paisos`
--

CREATE TABLE `pa_paisos` (
  `idPais` varchar(3) NOT NULL,
  `descripcio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pa_paisos`
--

INSERT INTO `pa_paisos` (`idPais`, `descripcio`) VALUES
('AND', 'Andorra'),
('ESP', 'Espanya'),
('ITA', 'Italia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pv_proveidors`
--

CREATE TABLE `pv_proveidors` (
  `idProveidor` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `idTipusCarrer` int(11) NOT NULL,
  `carrerNom` varchar(100) NOT NULL,
  `carrerNumero` varchar(10) NOT NULL,
  `carrerPis` varchar(3) NOT NULL,
  `carrerPorta` varchar(2) NOT NULL,
  `ciutat` varchar(50) NOT NULL,
  `codiPostal` varchar(10) NOT NULL,
  `idPais` varchar(3) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `fax` varchar(12) NOT NULL,
  `nif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pv_proveidors`
--

INSERT INTO `pv_proveidors` (`idProveidor`, `nom`, `idTipusCarrer`, `carrerNom`, `carrerNumero`, `carrerPis`, `carrerPorta`, `ciutat`, `codiPostal`, `idPais`, `telefon`, `fax`, `nif`) VALUES
(1, 'Antoñito', 1, 'Espronceda', '35', '5', '2', 'Sabadell', '08546', 'ESP', '6452145', '1111232', '35632411J'),
(2, 'Manolin', 2, 'A. Volta', '850', '6', '3', 'Padova', '33015', 'ITA', '+3943405623', '+3945558866', 'A452355552');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ul_ulleres`
--

CREATE TABLE `ul_ulleres` (
  `idullera` int(11) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `graduacioVidreDreta` varchar(10) NOT NULL,
  `graduacioVidreEsquerra` varchar(10) NOT NULL,
  `muntura` set('Flotant','Pasta','Metal.lica','') NOT NULL,
  `idColorMuntura` int(11) NOT NULL,
  `idColorVidreDret` int(11) NOT NULL,
  `idColorVidreEsquerra` int(11) NOT NULL,
  `preu` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ul_ulleres`
--

INSERT INTO `ul_ulleres` (`idullera`, `idMarca`, `graduacioVidreDreta`, `graduacioVidreEsquerra`, `muntura`, `idColorMuntura`, `idColorVidreDret`, `idColorVidreEsquerra`, `preu`) VALUES
(1, 1, '1', '2', 'Flotant', 2, 3, 3, '100.25'),
(2, 2, '1', '2', 'Metal.lica', 1, 4, 4, '125.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vd_vendes`
--

CREATE TABLE `vd_vendes` (
  `idVenda` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idEmpleat` int(11) NOT NULL,
  `dataVenda` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vd_vendes`
--

INSERT INTO `vd_vendes` (`idVenda`, `idClient`, `idEmpleat`, `dataVenda`) VALUES
(1, 1, 2, '2020-07-03'),
(2, 2, 1, '2020-07-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vd_vendesdetall`
--

CREATE TABLE `vd_vendesdetall` (
  `idVenda` int(11) NOT NULL,
  `idLiniaVenda` int(11) NOT NULL,
  `idUllera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vd_vendesdetall`
--

INSERT INTO `vd_vendesdetall` (`idVenda`, `idLiniaVenda`, `idUllera`) VALUES
(1, 1, 1),
(2, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cl_clients`
--
ALTER TABLE `cl_clients`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idClientRecomanacio` (`idClientRecomanacio`);

--
-- Indices de la tabla `em_empleats`
--
ALTER TABLE `em_empleats`
  ADD PRIMARY KEY (`idEmpleat`);

--
-- Indices de la tabla `gl_tipuscarrer`
--
ALTER TABLE `gl_tipuscarrer`
  ADD PRIMARY KEY (`idTipusCarrer`);

--
-- Indices de la tabla `gn_colors`
--
ALTER TABLE `gn_colors`
  ADD PRIMARY KEY (`idColor`);

--
-- Indices de la tabla `mq_marques`
--
ALTER TABLE `mq_marques`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `mq_marquesproveidor`
--
ALTER TABLE `mq_marquesproveidor`
  ADD PRIMARY KEY (`idMarcaProveidor`),
  ADD KEY `idProveidor` (`idProveidor`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indices de la tabla `pa_paisos`
--
ALTER TABLE `pa_paisos`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `pv_proveidors`
--
ALTER TABLE `pv_proveidors`
  ADD PRIMARY KEY (`idProveidor`),
  ADD KEY `idTipusCarrer` (`idTipusCarrer`),
  ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `ul_ulleres`
--
ALTER TABLE `ul_ulleres`
  ADD PRIMARY KEY (`idullera`),
  ADD KEY `idMarca` (`idMarca`),
  ADD KEY `idColorMuntura` (`idColorMuntura`),
  ADD KEY `idColorVidreDret` (`idColorVidreDret`),
  ADD KEY `idColorVidreEsquerra` (`idColorVidreEsquerra`);

--
-- Indices de la tabla `vd_vendes`
--
ALTER TABLE `vd_vendes`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `idEmpleat` (`idEmpleat`),
  ADD KEY `idClient` (`idClient`);

--
-- Indices de la tabla `vd_vendesdetall`
--
ALTER TABLE `vd_vendesdetall`
  ADD PRIMARY KEY (`idVenda`,`idLiniaVenda`),
  ADD KEY `idUllera` (`idUllera`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mq_marquesproveidor`
--
ALTER TABLE `mq_marquesproveidor`
  MODIFY `idMarcaProveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mq_marquesproveidor`
--
ALTER TABLE `mq_marquesproveidor`
  ADD CONSTRAINT `mq_marquesproveidor_ibfk_1` FOREIGN KEY (`idProveidor`) REFERENCES `pv_proveidors` (`idProveidor`),
  ADD CONSTRAINT `mq_marquesproveidor_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `mq_marques` (`idMarca`);

--
-- Filtros para la tabla `pv_proveidors`
--
ALTER TABLE `pv_proveidors`
  ADD CONSTRAINT `pv_proveidors_ibfk_1` FOREIGN KEY (`idTipusCarrer`) REFERENCES `gl_tipuscarrer` (`idTipusCarrer`),
  ADD CONSTRAINT `pv_proveidors_ibfk_2` FOREIGN KEY (`idPais`) REFERENCES `pa_paisos` (`idPais`);

--
-- Filtros para la tabla `ul_ulleres`
--
ALTER TABLE `ul_ulleres`
  ADD CONSTRAINT `ul_ulleres_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `mq_marques` (`idMarca`),
  ADD CONSTRAINT `ul_ulleres_ibfk_2` FOREIGN KEY (`idColorMuntura`) REFERENCES `gn_colors` (`idColor`),
  ADD CONSTRAINT `ul_ulleres_ibfk_3` FOREIGN KEY (`idColorVidreDret`) REFERENCES `gn_colors` (`idColor`),
  ADD CONSTRAINT `ul_ulleres_ibfk_4` FOREIGN KEY (`idColorVidreEsquerra`) REFERENCES `gn_colors` (`idColor`);

--
-- Filtros para la tabla `vd_vendes`
--
ALTER TABLE `vd_vendes`
  ADD CONSTRAINT `vd_vendes_ibfk_1` FOREIGN KEY (`idEmpleat`) REFERENCES `em_empleats` (`idEmpleat`),
  ADD CONSTRAINT `vd_vendes_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `cl_clients` (`idCliente`);

--
-- Filtros para la tabla `vd_vendesdetall`
--
ALTER TABLE `vd_vendesdetall`
  ADD CONSTRAINT `vd_vendesdetall_ibfk_1` FOREIGN KEY (`idUllera`) REFERENCES `ul_ulleres` (`idullera`),
  ADD CONSTRAINT `vd_vendesdetall_ibfk_2` FOREIGN KEY (`idVenda`) REFERENCES `vd_vendes` (`idVenda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
