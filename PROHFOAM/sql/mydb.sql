-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-02-2019 a las 06:15:27
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_guardar_contacto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_guardar_contacto` (IN `sp_primer_nombre` VARCHAR(20), IN `sp_segundo_nombre` VARCHAR(20), IN `sp_primer_apellido` VARCHAR(20), IN `sp_segundo_apellido` VARCHAR(20), IN `sp_email` VARCHAR(45), IN `sp_numero_celular` VARCHAR(20), IN `sp_ciudad` VARCHAR(20), IN `sp_colonia` VARCHAR(20), IN `sp_tipo_cliente` VARCHAR(20), IN `sp_calle` INT(11), IN `sp_bloque` VARCHAR(20), IN `sp_casa` VARCHAR(20))  BEGIN

  INSERT INTO Direccion (ciudad, colonia, calle, bloque, numeroCasa) VALUES (sp_ciudad, sp_colonia, sp_calle, sp_bloque, sp_casa);
  INSERT INTO Persona (idDireccion, pNombre, sNombre, pApellido, sApellido, correoElectronico) VALUES (LAST_INSERT_ID(), sp_primer_nombre, sp_segundo_nombre, sp_primer_apellido, sp_segundo_apellido, sp_email);
  INSERT INTO Cliente (idPersona, fechaRegistro, Tipo_Cliente) VALUES  (LAST_INSERT_ID(), NOW(), sp_tipo_cliente);
  INSERT INTO Telefono (idPersona, numero) VALUES (LAST_INSERT_ID(), sp_numero_celular);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

DROP TABLE IF EXISTS `bodega`;
CREATE TABLE IF NOT EXISTS `bodega` (
  `idBodega` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBodega`),
  KEY `fk_Bodega_Sucursal1_idx` (`idSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegaproducto`
--

DROP TABLE IF EXISTS `bodegaproducto`;
CREATE TABLE IF NOT EXISTS `bodegaproducto` (
  `idBodega` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cubiculo` varchar(45) DEFAULT NULL,
  KEY `fk_BodegaMedicamento_Bodega1_idx` (`idBodega`),
  KEY `fk_BodegaMedicamento_Producto1_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

DROP TABLE IF EXISTS `categoriaproducto`;
CREATE TABLE IF NOT EXISTS `categoriaproducto` (
  `idCategoriaProducto` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategoriaProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) NOT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `Tipo_Cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_Cliente_Persona1_idx` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idPersona`, `fechaRegistro`, `Tipo_Cliente`) VALUES
(1, 1, '2019-02-19', 'sghfgh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

DROP TABLE IF EXISTS `descuento`;
CREATE TABLE IF NOT EXISTS `descuento` (
  `idDescuento` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `valor` double NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`idDescuento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `idDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `calle` int(11) DEFAULT NULL,
  `bloque` varchar(45) DEFAULT NULL,
  `numeroCasa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES
(1, 'aasd', 'dsfsdf', 11, 'fdgh', 'fgh'),
(2, 'aasd', 'dsfsdf', 11, 'fdgh', 'fgh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idRoles` int(11) NOT NULL,
  `fechaNombramiento` date NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `fk_Empleado_Persona1_idx` (`idPersona`),
  KEY `fk_Empleado_Roles1_idx` (`idRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

DROP TABLE IF EXISTS `entrada`;
CREATE TABLE IF NOT EXISTS `entrada` (
  `idEntrada` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idProveedores` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idEntrada`),
  KEY `fk_Entrada_Empleado1_idx` (`idEmpleado`),
  KEY `fk_Entrada_Proveedor1_idx` (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `isv` varchar(45) NOT NULL,
  `total` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_Factura_Cliente1_idx` (`idCliente`),
  KEY `fk_Factura_Forma_Pago1_idx` (`idFormaPago`),
  KEY `fk_Factura_Empleado1_idx` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadescuento`
--

DROP TABLE IF EXISTS `facturadescuento`;
CREATE TABLE IF NOT EXISTS `facturadescuento` (
  `idFactura` int(11) NOT NULL,
  `idDescuento` int(11) NOT NULL,
  KEY `fk_FacturaDescuento_Factura1_idx` (`idFactura`),
  KEY `fk_FacturaDescuento_Descuento1_idx` (`idDescuento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadetalle`
--

DROP TABLE IF EXISTS `facturadetalle`;
CREATE TABLE IF NOT EXISTS `facturadetalle` (
  `idProducto` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  KEY `fk_FacturaDetalle_Producto1_idx` (`idProducto`),
  KEY `fk_FacturaDetalle_Factura1_idx` (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

DROP TABLE IF EXISTS `formapago`;
CREATE TABLE IF NOT EXISTS `formapago` (
  `idFormaPago` int(11) NOT NULL,
  `DescripcionPago` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFormaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `fechaPedido` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Cliente1_idx` (`idCliente`),
  KEY `fk_Pedido_Producto1_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `idDireccion` int(11) NOT NULL,
  `pNombre` varchar(45) NOT NULL,
  `sNombre` varchar(45) NOT NULL,
  `pApellido` varchar(80) NOT NULL,
  `sApellido` varchar(15) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `fk_Persona_Direccion1_idx` (`idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES
(1, 2, 'Daniel', 'Alejandro', 'Ochoa', 'LÃ³pez', 'danielochoa01@yahoo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL,
  `idCategoriaProducto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precioUnitario` double NOT NULL,
  `fechaElaboracion` date NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_Producto_CategoriaPRoducto1_idx` (`idCategoriaProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoentrada`
--

DROP TABLE IF EXISTS `productoentrada`;
CREATE TABLE IF NOT EXISTS `productoentrada` (
  `idProducto` int(11) NOT NULL,
  `idEntrada` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`idEntrada`),
  KEY `fk_Producto_has_Entrada_Entrada1_idx` (`idEntrada`),
  KEY `fk_Producto_has_Entrada_Producto1_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosalida`
--

DROP TABLE IF EXISTS `productosalida`;
CREATE TABLE IF NOT EXISTS `productosalida` (
  `idProducto` int(11) NOT NULL,
  `idSalida` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`idSalida`),
  KEY `fk_Producto_has_Salida_Salida1_idx` (`idSalida`),
  KEY `fk_Producto_has_Salida_Producto1_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedores` int(11) NOT NULL,
  `empresa` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` int(11) NOT NULL,
  `NombreRol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

DROP TABLE IF EXISTS `salida`;
CREATE TABLE IF NOT EXISTS `salida` (
  `idSalida` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idSalida`),
  KEY `fk_Salida_Empleado1_idx` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `idTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) NOT NULL,
  `numero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTelefono`),
  KEY `fk_Telefono_Persona1_idx` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`idTelefono`, `idPersona`, `numero`) VALUES
(1, 1, '87809471');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `fk_Bodega_Sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bodegaproducto`
--
ALTER TABLE `bodegaproducto`
  ADD CONSTRAINT `fk_BodegaMedicamento_Bodega1` FOREIGN KEY (`idBodega`) REFERENCES `bodega` (`idBodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_BodegaMedicamento_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Cliente_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Empleado_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Empleado_Roles1` FOREIGN KEY (`idRoles`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_Entrada_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entrada_Proveedor1` FOREIGN KEY (`idProveedores`) REFERENCES `proveedor` (`idProveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_Forma_Pago1` FOREIGN KEY (`idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturadescuento`
--
ALTER TABLE `facturadescuento`
  ADD CONSTRAINT `fk_FacturaDescuento_Descuento1` FOREIGN KEY (`idDescuento`) REFERENCES `descuento` (`idDescuento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_FacturaDescuento_Factura1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD CONSTRAINT `fk_FacturaDetalle_Factura1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_FacturaDetalle_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_Persona_Direccion1` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_CategoriaPRoducto1` FOREIGN KEY (`idCategoriaProducto`) REFERENCES `categoriaproducto` (`idCategoriaProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productoentrada`
--
ALTER TABLE `productoentrada`
  ADD CONSTRAINT `fk_Producto_has_Entrada_Entrada1` FOREIGN KEY (`idEntrada`) REFERENCES `entrada` (`idEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_Entrada_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productosalida`
--
ALTER TABLE `productosalida`
  ADD CONSTRAINT `fk_Producto_has_Salida_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_Salida_Salida1` FOREIGN KEY (`idSalida`) REFERENCES `salida` (`idSalida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `fk_Salida_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `fk_Telefono_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
