<?php

	include("../class/eclass_conexion.php");
	
	$conexion = new Conexion();

	$primerNombre =$_POST['primer-nombre'];
	$segundoNombre = $_POST['segundo-nombre'];
	$primerApellido = $_POST['primer-apellido'];
	$segundoApellido = $_POST['segundo-apellido'];
	$email = $_POST['email'];
	$numeroCelular = $_POST['numero-celular'];
	$ciudad = $_POST['ciudad'];
	$colonia = $_POST['colonia'];
	$tipoCliente = $_POST['tipo-cliente'];
	$calle = $_POST['calle'];
	$bloque = $_POST['bloque'];
	$casa = $_POST['casa'];


	$sql = sprintf("CALL sp_guardar_contacto('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')",
			stripslashes($primerNombre),
			stripslashes($segundoNombre),
			stripslashes($primerApellido),
			stripslashes($segundoApellido),
			stripslashes($email),
			stripslashes($numeroCelular),
			stripslashes($ciudad),
			stripslashes($colonia),
			stripslashes($tipoCliente),
			stripslashes($calle),
			stripslashes($bloque),
			stripslashes($casa)
	);

	$resultado = $conexion->executeQuery($sql);
	
	if ($resultado) {
		$mensaje = array(
			'status' => 200, 
			'mensaje' => 'Registro almacenado con éxito!'
		);
	} else {
		$error = $conexion->getError();
		$mensaje = array(
			'status' => 501, 
			'mensaje' => $error
		);
	}

	echo json_encode($mensaje);