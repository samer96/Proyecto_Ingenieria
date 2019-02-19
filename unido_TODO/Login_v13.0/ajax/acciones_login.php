<?php
	session_start(); 
			include_once("../class/class_conexion.php");
			include_once("../class/class_usuario.php");
			$conexion = new Conexion();
			Usuario::validarUsuario($conexion,$_POST["username"],$_POST["pass"]);
			
?>