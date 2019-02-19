-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2019 a las 07:51:30
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.1.16

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `idBodega` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegaproducto`
--

CREATE TABLE `bodegaproducto` (
  `idBodega` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cubiculo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `idCategoriaProducto` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `Tipo_Cliente` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `idDescuento` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `valor` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `calle` int(11) DEFAULT NULL,
  `bloque` varchar(45) DEFAULT NULL,
  `numeroCasa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES
(0, 'Tegucigalpa', 'Prados', 13, 'h', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idRoles` int(11) NOT NULL,
  `fechaNombramiento` date NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `idPersona`, `idRoles`, `fechaNombramiento`, `usuario`, `contrasena`) VALUES
(0, 0, 2, '1999-02-07', 'JuanP', 'asd.456'),
(1, 1, 2, '1999-02-07', 'lucas', 'asd.456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `idEntrada` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idProveedores` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `isv` varchar(45) NOT NULL,
  `total` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `observacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadescuento`
--

CREATE TABLE `facturadescuento` (
  `idFactura` int(11) NOT NULL,
  `idDescuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadetalle`
--

CREATE TABLE `facturadetalle` (
  `idProducto` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

CREATE TABLE `formapago` (
  `idFormaPago` int(11) NOT NULL,
  `DescripcionPago` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `fechaPedido` datetime NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  `pNombre` varchar(45) NOT NULL,
  `sNombre` varchar(45) NOT NULL,
  `pApellido` varchar(80) NOT NULL,
  `sApellido` varchar(15) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES
(0, 0, 'Juan', 'Pedro', 'Perez', 'Lopez', 'juan@gmail.com'),
(1, 0, 'Lucas', 'Jose', 'Tinoco', 'Morale', 'lucas@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `idCategoriaProducto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precioUnitario` double NOT NULL,
  `fechaElaboracion` date NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoentrada`
--

CREATE TABLE `productoentrada` (
  `idProducto` int(11) NOT NULL,
  `idEntrada` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosalida`
--

CREATE TABLE `productosalida` (
  `idProducto` int(11) NOT NULL,
  `idSalida` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedores` int(11) NOT NULL,
  `empresa` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `NombreRol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `NombreRol`) VALUES
(1, 'admin'),
(2, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `idSalida` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `idTelefono` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `numero` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`idBodega`),
  ADD KEY `fk_Bodega_Sucursal1_idx` (`idSucursal`);

--
-- Indices de la tabla `bodegaproducto`
--
ALTER TABLE `bodegaproducto`
  ADD KEY `fk_BodegaMedicamento_Bodega1_idx` (`idBodega`),
  ADD KEY `fk_BodegaMedicamento_Producto1_idx` (`idProducto`);

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`idCategoriaProducto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_Cliente_Persona1_idx` (`idPersona`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`idDescuento`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `fk_Empleado_Persona1_idx` (`idPersona`),
  ADD KEY `fk_Empleado_Roles1_idx` (`idRoles`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`idEntrada`),
  ADD KEY `fk_Entrada_Empleado1_idx` (`idEmpleado`),
  ADD KEY `fk_Entrada_Proveedor1_idx` (`idProveedores`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `fk_Factura_Cliente1_idx` (`idCliente`),
  ADD KEY `fk_Factura_Forma_Pago1_idx` (`idFormaPago`),
  ADD KEY `fk_Factura_Empleado1_idx` (`idEmpleado`);

--
-- Indices de la tabla `facturadescuento`
--
ALTER TABLE `facturadescuento`
  ADD KEY `fk_FacturaDescuento_Factura1_idx` (`idFactura`),
  ADD KEY `fk_FacturaDescuento_Descuento1_idx` (`idDescuento`);

--
-- Indices de la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD KEY `fk_FacturaDetalle_Producto1_idx` (`idProducto`),
  ADD KEY `fk_FacturaDetalle_Factura1_idx` (`idFactura`);

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`idFormaPago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_Pedido_Cliente1_idx` (`idCliente`),
  ADD KEY `fk_Pedido_Producto1_idx` (`idProducto`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `fk_Persona_Direccion1_idx` (`idDireccion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_Producto_CategoriaPRoducto1_idx` (`idCategoriaProducto`);

--
-- Indices de la tabla `productoentrada`
--
ALTER TABLE `productoentrada`
  ADD PRIMARY KEY (`idProducto`,`idEntrada`),
  ADD KEY `fk_Producto_has_Entrada_Entrada1_idx` (`idEntrada`),
  ADD KEY `fk_Producto_has_Entrada_Producto1_idx` (`idProducto`);

--
-- Indices de la tabla `productosalida`
--
ALTER TABLE `productosalida`
  ADD PRIMARY KEY (`idProducto`,`idSalida`),
  ADD KEY `fk_Producto_has_Salida_Salida1_idx` (`idSalida`),
  ADD KEY `fk_Producto_has_Salida_Producto1_idx` (`idProducto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedores`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`idSalida`),
  ADD KEY `fk_Salida_Empleado1_idx` (`idEmpleado`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idSucursal`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`idTelefono`),
  ADD KEY `fk_Telefono_Persona1_idx` (`idPersona`);

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
