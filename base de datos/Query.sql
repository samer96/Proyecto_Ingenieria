/*Tabla DIRECCION*/
INSERT INTO `direccion`(`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES ('0','Tegucigalpa','Hato de enmedio','12','Z','11');
INSERT INTO `direccion`(`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES ('1','Tegucigalpa','Kennedy','121','ZA','113');
INSERT INTO `direccion`(`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES ('2','Tegucigalpa','Miraflores','142','A','098');
INSERT INTO `direccion`(`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES ('3','Tegucigalpa','San Angel','456','CV','8675');
INSERT INTO `direccion`(`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES ('4','Tegucigalpa','Victor F. Ardon','13452','KL','65');
INSERT INTO `direccion`(`idDireccion`, `ciudad`, `colonia`, `calle`, `bloque`, `numeroCasa`) VALUES ('5','Tegucigalpa','Bella Oriente','1236','AS','9871');

/*Tabla Persona*/

INSERT INTO `persona`(`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES ('0','0','Jose','Manuel','Rosales','Perez','manuelros@hmail.com');
INSERT INTO `persona`(`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES ('1','1','Juan','Manuel','Orlando','Diaz','ordias@hmail.com');
INSERT INTO `persona`(`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES ('2','2','Lucas','Diosinisio','Vazquez','Lainez','Lainezluc@hmail.com');
INSERT INTO `persona`(`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES ('3','3','Mario','Moises','Cruz','Maldonado','mmcruz@hmail.com');
INSERT INTO `persona`(`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES ('4','4','Pedro','Pablo','Sanchez','Figueroa','ppfigeroa@hmail.com');
INSERT INTO `persona`(`idPersona`, `idDireccion`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `correoElectronico`) VALUES ('5','5','Brenda','Isabel','Martinez','Maradiaga','manuelros@hmail.com');

/*Tabla CategoriaProducto*/
INSERT INTO `categoriaproducto`(`idCategoriaProducto`, `descripcion`) VALUES ('0','Hogar');
INSERT INTO `categoriaproducto`(`idCategoriaProducto`, `descripcion`) VALUES ('1','Oficina');
INSERT INTO `categoriaproducto`(`idCategoriaProducto`, `descripcion`) VALUES ('2','Jardin');

/*Tabla Clientes*/
INSERT INTO `cliente`(`idCliente`, `idPersona`, `fechaRegistro`, `Tipo_Cliente`) VALUES ('0','0','2017-10-10','Ocacionales');
INSERT INTO `cliente`(`idCliente`, `idPersona`, `fechaRegistro`, `Tipo_Cliente`) VALUES ('1','2','2017-10-11','Frecuentes');

/*Tabla Descuentos*/
INSERT INTO `descuento`(`idDescuento`, `descripcion`, `valor`, `estado`) VALUES ('0','Descripcion1','20','Nuevo');
INSERT INTO `descuento`(`idDescuento`, `descripcion`, `valor`, `estado`) VALUES ('1','Descripcion2','50','Usado');
INSERT INTO `descuento`(`idDescuento`, `descripcion`, `valor`, `estado`) VALUES ('2','Descripcion3','70','Semi Nuevo')

/*Tabla Forma Pago*/
INSERT INTO `formapago`(`idFormaPago`, `DescripcionPago`, `estado`) VALUES ('0','Efectivo','Habilitado');
INSERT INTO `formapago`(`idFormaPago`, `DescripcionPago`, `estado`) VALUES ('1','Tarjeta','Habilitado');
INSERT INTO `formapago`(`idFormaPago`, `DescripcionPago`, `estado`) VALUES ('2','Credito','Inabilitado');

/*Tabla Proveedor*/
INSERT INTO `proveedor`(`idProveedores`, `empresa`, `numero`, `direccion`) VALUES ('0','Carpinteria Luz','1','Comayaguela, 6°a');
INSERT INTO `proveedor`(`idProveedores`, `empresa`, `numero`, `direccion`) VALUES ('1','Asociados Cruz','2','Comayaguela, 8°a');
INSERT INTO `proveedor`(`idProveedores`, `empresa`, `numero`, `direccion`) VALUES ('2','Abarroteria','3','Tegucigalpa, Barrio Morazan');

/*Tabla rol*/
INSERT INTO `rol`(`idRol`, `NombreRol`) VALUES ('0','Administrador');
INSERT INTO `rol`(`idRol`, `NombreRol`) VALUES ('1','Vendedor');

/*Tabla Telefono*/
INSERT INTO `telefono`(`idTelefono`, `idPersona`, `numero`) VALUES ('0','0','9876-2134');
INSERT INTO `telefono`(`idTelefono`, `idPersona`, `numero`) VALUES ('1','2','9554-6536');
INSERT INTO `telefono`(`idTelefono`, `idPersona`, `numero`) VALUES ('2','3','9623-7635');
INSERT INTO `telefono`(`idTelefono`, `idPersona`, `numero`) VALUES ('3','4','9942-7634');
INSERT INTO `telefono`(`idTelefono`, `idPersona`, `numero`) VALUES ('4','1','9843-5433');
INSERT INTO `telefono`(`idTelefono`, `idPersona`, `numero`) VALUES ('5','1','9045-2232');

/*Tabla sucursales*/
INSERT INTO `sucursal`(`idSucursal`, `nombre`, `direccion`, `telefono`) VALUES ('0','Sucursal1','Choluteca','9876-3223');
INSERT INTO `sucursal`(`idSucursal`, `nombre`, `direccion`, `telefono`) VALUES ('1','Sucursal2','Tegucigalpa','9900-3223');
INSERT INTO `sucursal`(`idSucursal`, `nombre`, `direccion`, `telefono`) VALUES ('2','Sucursal3','La Ceiba','9533-3223');
INSERT INTO `sucursal`(`idSucursal`, `nombre`, `direccion`, `telefono`) VALUES ('3','Sucursal4','Lempira','9906-3223');

/*Tabla producto*/
INSERT INTO `producto`(`idProducto`, `idCategoriaProducto`, `nombre`, `precioUnitario`, `fechaElaboracion`, `imagen`, `cantidad`) VALUES ('0','0','Cama Personal','100000','2017-11-01','img/hogar/hogar1.jpg','1');
INSERT INTO `producto`(`idProducto`, `idCategoriaProducto`, `nombre`, `precioUnitario`, `fechaElaboracion`, `imagen`, `cantidad`) VALUES ('1','0','Cama Matrimonial','150000','2017-11-01','img/hogar/hogar2.jpg','1');
INSERT INTO `producto`(`idProducto`, `idCategoriaProducto`, `nombre`, `precioUnitario`, `fechaElaboracion`, `imagen`, `cantidad`) VALUES ('2','1','Mesa','2000','2017-11-01','img/oficina/oficina1.jpg','1');
INSERT INTO `producto`(`idProducto`, `idCategoriaProducto`, `nombre`, `precioUnitario`, `fechaElaboracion`, `imagen`, `cantidad`) VALUES ('3','1','Silla','200000','2017-11-01','img/oficna/oficna2.jpg','1');
INSERT INTO `producto`(`idProducto`, `idCategoriaProducto`, `nombre`, `precioUnitario`, `fechaElaboracion`, `imagen`, `cantidad`) VALUES ('4','0','Colchon','1000','2017-11-01','img/hogar/hogar3.jpg','1');

/*Tabla bodega*/
INSERT INTO `bodega`(`idBodega`, `idSucursal`, `nombre`) VALUES ('0','0','Bodega1');
INSERT INTO `bodega`(`idBodega`, `idSucursal`, `nombre`) VALUES ('1','1','Bodega2');
INSERT INTO `bodega`(`idBodega`, `idSucursal`, `nombre`) VALUES ('2','1','Bodega3');
INSERT INTO `bodega`(`idBodega`, `idSucursal`, `nombre`) VALUES ('3','2','Bodega4');

/*Tabla bodega producto*/
INSERT INTO `bodegaproducto`(`idBodega`, `idProducto`, `cubiculo`) VALUES ('0','0','23');
INSERT INTO `bodegaproducto`(`idBodega`, `idProducto`, `cubiculo`) VALUES ('1','1','235');
INSERT INTO `bodegaproducto`(`idBodega`, `idProducto`, `cubiculo`) VALUES ('2','2','23345');
INSERT INTO `bodegaproducto`(`idBodega`, `idProducto`, `cubiculo`) VALUES ('0','0','3423');
INSERT INTO `bodegaproducto`(`idBodega`, `idProducto`, `cubiculo`) VALUES ('0','1','77623');


/*Tabla empleadp*/
INSERT INTO `empleado`(`idEmpleado`, `idPersona`, `idRoles`, `fechaNombramiento`, `usuario`, `contraseña`) VALUES ('0','0','1','2017-11-01','user1','asd.456');
INSERT INTO `empleado`(`idEmpleado`, `idPersona`, `idRoles`, `fechaNombramiento`, `usuario`, `contraseña`) VALUES ('1','1','0','2017-11-01','user2','asd.456');
INSERT INTO `empleado`(`idEmpleado`, `idPersona`, `idRoles`, `fechaNombramiento`, `usuario`, `contraseña`) VALUES ('2','2','1','2017-11-01','user3','asd.456');
INSERT INTO `empleado`(`idEmpleado`, `idPersona`, `idRoles`, `fechaNombramiento`, `usuario`, `contraseña`) VALUES ('3','3','1','2017-11-01','user4','asd.456');

/*Tabla entrada*/
INSERT INTO `entrada`(`idEntrada`, `idEmpleado`, `idProveedores`, `fecha`) VALUES ('0','1','0','2017-11-01');
INSERT INTO `entrada`(`idEntrada`, `idEmpleado`, `idProveedores`, `fecha`) VALUES ('1','1','1','2017-11-01');
INSERT INTO `entrada`(`idEntrada`, `idEmpleado`, `idProveedores`, `fecha`) VALUES ('2','1','2','2017-11-01');
INSERT INTO `entrada`(`idEntrada`, `idEmpleado`, `idProveedores`, `fecha`) VALUES ('3','2','1','2017-11-01');

/*Tabla salida*/
INSERT INTO `salida`(`idSalida`, `idEmpleado`, `fecha`) VALUES ('0','0','2017-11-01');
INSERT INTO `salida`(`idSalida`, `idEmpleado`, `fecha`) VALUES ('1','1','2017-11-01');
INSERT INTO `salida`(`idSalida`, `idEmpleado`, `fecha`) VALUES ('2','2','2017-11-01');
INSERT INTO `salida`(`idSalida`, `idEmpleado`, `fecha`) VALUES ('3','3','2017-11-01');

/*Tabla Producnto salida*/
INSERT INTO `productosalida`(`idProducto`, `idSalida`, `cantidad`) VALUES ('0','0','1100');
INSERT INTO `productosalida`(`idProducto`, `idSalida`, `cantidad`) VALUES ('1','1','2100');
INSERT INTO `productosalida`(`idProducto`, `idSalida`, `cantidad`) VALUES ('2','0','8800');
INSERT INTO `productosalida`(`idProducto`, `idSalida`, `cantidad`) VALUES ('3','3','1650');

/*Tabla Producnto entrada*/
INSERT INTO `productoentrada`(`idProducto`, `idEntrada`, `cantidad`) VALUES ('0','0','4000');
INSERT INTO `productoentrada`(`idProducto`, `idEntrada`, `cantidad`) VALUES ('1','1','7000');
INSERT INTO `productoentrada`(`idProducto`, `idEntrada`, `cantidad`) VALUES ('2','2','8000');
INSERT INTO `productoentrada`(`idProducto`, `idEntrada`, `cantidad`) VALUES ('3','1','9000');

/*Tabla pedido*/
INSERT INTO `pedido`(`idPedido`, `idCliente`, `idProducto`, `fechaPedido`, `cantidad`) VALUES ('0','0','0','2017-11-01','2');
INSERT INTO `pedido`(`idPedido`, `idCliente`, `idProducto`, `fechaPedido`, `cantidad`) VALUES ('1','1','1','2017-11-01','2');

/*Tabla Factura*/
INSERT INTO `factura`(`idFactura`, `idCliente`, `idFormaPago`, `idEmpleado`, `fecha`, `observaciones`, `isv`, `total`, `subtotal`, `observacion`) VALUES ('0','0','0','0','2017-11-01','Ninguna','15%','434','1200','Niguna');
INSERT INTO `factura`(`idFactura`, `idCliente`, `idFormaPago`, `idEmpleado`, `fecha`, `observaciones`, `isv`, `total`, `subtotal`, `observacion`) VALUES ('1','0','0','0','2017-11-01','Ninguna','15%','434','1200','Niguna');

/*Tabla Factura descuento*/
INSERT INTO `facturadescuento`(`idFactura`, `idDescuento`) VALUES ('0','1');
INSERT INTO `facturadescuento`(`idFactura`, `idDescuento`) VALUES ('1','2');

/*Tabla Factura detalle*/
INSERT INTO `facturadetalle`(`idProducto`, `idFactura`, `cantidad`) VALUES ('0','0','2');
INSERT INTO `facturadetalle`(`idProducto`, `idFactura`, `cantidad`) VALUES ('1','1','2');
INSERT INTO `facturadetalle`(`idProducto`, `idFactura`, `cantidad`) VALUES ('2','0','2');
INSERT INTO `facturadetalle`(`idProducto`, `idFactura`, `cantidad`) VALUES ('3','0','2');
