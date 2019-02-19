<?php

	class Usuario{

		private $nombre;
		private $apellido;
		private $correo;
		private $contrasena;

		public function __construct($nombre,
					$apellido,
					$correo,
					$contrasena){
			$this->nombre = $nombre;
			$this->apellido = $apellido;
			$this->correo = $correo;
			$this->contrasena = $contrasena;
		}
		public function getNombre(){
			return $this->nombre;
		}
		public function setNombre($nombre){
			$this->nombre = $nombre;
		}
		public function getApellido(){
			return $this->apellido;
		}
		public function setApellido($apellido){
			$this->apellido = $apellido;
		}
		public function getCorreo(){
			return $this->correo;
		}
		public function setCorreo($correo){
			$this->correo = $correo;
		}
		public function getContrasena(){
			return $this->contrasena;
		}
		public function setContrasena($contrasena){
			$this->contrasena = $contrasena;
		}
		public function toString(){
			return "Nombre: " . $this->nombre . 
				" Apellido: " . $this->apellido . 
				" Correo: " . $this->correo . 
				" Contrasena: " . $this->contrasena;
		}
		public function validarUsuario($conexion, $correo,$contrasena){
			$sql = sprintf("SELECT usuario, contrasena FROM empleado WHERE usuario='%s' AND contrasena='%s'",
				$correo,
				$contrasena);
			$resultado = $conexion->ejecutarConsulta($sql);

			$fila= $conexion->obtenerFila($resultado);

			$cantidadRegistros = $conexion->cantidadRegistros($resultado);
			//echo "$cantidadRegistros";
			//verificar que solo existe un usuario c
			if ($cantidadRegistros==1) {
				$_SESSION['usuario']=$fila[0];
                $_SESSION['contrasena']=$fila[1];

				header("location: ../ventanaempleado.html");

				
			}
			else{
				header("location: ../index.html");
				
				
				
			}
			
		}
	}
?>