-- MySQL Script generated by MySQL Workbench
-- Sun Feb 17 17:19:51 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direccion` (
  `idDireccion` INT NOT NULL,
  `ciudad` VARCHAR(45) NULL,
  `colonia` VARCHAR(45) NULL,
  `calle` INT NULL,
  `bloque` VARCHAR(45) NULL,
  `numeroCasa` VARCHAR(45) NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `idPersona` INT NOT NULL,
  `idDireccion` INT NOT NULL,
  `pNombre` VARCHAR(45) NOT NULL,
  `sNombre` VARCHAR(45) NOT NULL,
  `pApellido` VARCHAR(80) NOT NULL,
  `sApellido` VARCHAR(15) NOT NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `fk_Persona_Direccion1_idx` (`idDireccion` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Direccion1`
    FOREIGN KEY (`idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rol` (
  `idRol` INT NOT NULL,
  `NombreRol` VARCHAR(45) NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor` (
  `idProveedores` INT NOT NULL,
  `empresa` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `idPersona` INT NOT NULL,
  `fechaRegistro` DATE NULL,
  `Tipo_Cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Persona1_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CategoriaProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CategoriaProducto` (
  `idCategoriaProducto` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoriaProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `idProducto` INT NOT NULL,
  `idCategoriaProducto` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precioUnitario` DOUBLE NOT NULL,
  `fechaElaboracion` DATE NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Producto_CategoriaPRoducto1_idx` (`idCategoriaProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_CategoriaPRoducto1`
    FOREIGN KEY (`idCategoriaProducto`)
    REFERENCES `mydb`.`CategoriaProducto` (`idCategoriaProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `fechaPedido` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_Pedido_Producto1_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FormaPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FormaPago` (
  `idFormaPago` INT NOT NULL,
  `DescripcionPago` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idFormaPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `idPersona` INT NOT NULL,
  `idRoles` INT NOT NULL,
  `fechaNombramiento` DATE NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_Empleado_Persona1_idx` (`idPersona` ASC) VISIBLE,
  INDEX `fk_Empleado_Roles1_idx` (`idRoles` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Roles1`
    FOREIGN KEY (`idRoles`)
    REFERENCES `mydb`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Factura` (
  `idFactura` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idFormaPago` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `fecha` DATE NULL,
  `observaciones` VARCHAR(45) NULL,
  `isv` VARCHAR(45) NOT NULL,
  `total` DOUBLE NULL,
  `subtotal` DOUBLE NOT NULL,
  `observacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_Factura_Forma_Pago1_idx` (`idFormaPago` ASC) VISIBLE,
  INDEX `fk_Factura_Empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Forma_Pago1`
    FOREIGN KEY (`idFormaPago`)
    REFERENCES `mydb`.`FormaPago` (`idFormaPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `idTelefono` INT NOT NULL,
  `idPersona` INT NOT NULL,
  `numero` VARCHAR(45) NULL,
  PRIMARY KEY (`idTelefono`),
  INDEX `fk_Telefono_Persona1_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Telefono_Persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Descuento` (
  `idDescuento` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `estado` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idDescuento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FacturaDescuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FacturaDescuento` (
  `idFactura` INT NOT NULL,
  `idDescuento` INT NOT NULL,
  INDEX `fk_FacturaDescuento_Factura1_idx` (`idFactura` ASC) VISIBLE,
  INDEX `fk_FacturaDescuento_Descuento1_idx` (`idDescuento` ASC) VISIBLE,
  CONSTRAINT `fk_FacturaDescuento_Factura1`
    FOREIGN KEY (`idFactura`)
    REFERENCES `mydb`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaDescuento_Descuento1`
    FOREIGN KEY (`idDescuento`)
    REFERENCES `mydb`.`Descuento` (`idDescuento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FacturaDetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FacturaDetalle` (
  `idProducto` INT NOT NULL,
  `idFactura` INT NOT NULL,
  `cantidad` VARCHAR(45) NULL,
  INDEX `fk_FacturaDetalle_Producto1_idx` (`idProducto` ASC) VISIBLE,
  INDEX `fk_FacturaDetalle_Factura1_idx` (`idFactura` ASC) VISIBLE,
  CONSTRAINT `fk_FacturaDetalle_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaDetalle_Factura1`
    FOREIGN KEY (`idFactura`)
    REFERENCES `mydb`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sucursal` (
  `idSucursal` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idSucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bodega` (
  `idBodega` INT NOT NULL,
  `idSucursal` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idBodega`),
  INDEX `fk_Bodega_Sucursal1_idx` (`idSucursal` ASC) VISIBLE,
  CONSTRAINT `fk_Bodega_Sucursal1`
    FOREIGN KEY (`idSucursal`)
    REFERENCES `mydb`.`Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BodegaProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BodegaProducto` (
  `idBodega` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `cubiculo` VARCHAR(45) NULL,
  INDEX `fk_BodegaMedicamento_Bodega1_idx` (`idBodega` ASC) VISIBLE,
  INDEX `fk_BodegaMedicamento_Producto1_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_BodegaMedicamento_Bodega1`
    FOREIGN KEY (`idBodega`)
    REFERENCES `mydb`.`Bodega` (`idBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BodegaMedicamento_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrada` (
  `idEntrada` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `idProveedores` INT NOT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`idEntrada`),
  INDEX `fk_Entrada_Empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  INDEX `fk_Entrada_Proveedor1_idx` (`idProveedores` ASC) VISIBLE,
  CONSTRAINT `fk_Entrada_Empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrada_Proveedor1`
    FOREIGN KEY (`idProveedores`)
    REFERENCES `mydb`.`Proveedor` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salida` (
  `idSalida` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`idSalida`),
  INDEX `fk_Salida_Empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_Salida_Empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProductoEntrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProductoEntrada` (
  `idProducto` INT NOT NULL,
  `idEntrada` INT NOT NULL,
  `cantidad` DOUBLE NULL,
  INDEX `fk_Producto_has_Entrada_Entrada1_idx` (`idEntrada` ASC) VISIBLE,
  INDEX `fk_Producto_has_Entrada_Producto1_idx` (`idProducto` ASC) VISIBLE,
  PRIMARY KEY (`idProducto`, `idEntrada`),
  CONSTRAINT `fk_Producto_has_Entrada_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Entrada_Entrada1`
    FOREIGN KEY (`idEntrada`)
    REFERENCES `mydb`.`Entrada` (`idEntrada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProductoSalida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProductoSalida` (
  `idProducto` INT NOT NULL,
  `idSalida` INT NOT NULL,
  `cantidad` DOUBLE NULL,
  PRIMARY KEY (`idProducto`, `idSalida`),
  INDEX `fk_Producto_has_Salida_Salida1_idx` (`idSalida` ASC) VISIBLE,
  INDEX `fk_Producto_has_Salida_Producto1_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_has_Salida_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Salida_Salida1`
    FOREIGN KEY (`idSalida`)
    REFERENCES `mydb`.`Salida` (`idSalida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
