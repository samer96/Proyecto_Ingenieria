<?php
	class Empleado{
		private $pnombre;
		private $snombre;
		private $papellido;
		private $sapellido;
		private $correo;
		public function __construct($pnombre,
					$snombre,
					$papellido,
					$sapellido,
					$correo){
			$this->pnombre = $pnombre;
			$this->snombre = $snombre;
			$this->papellido = $papellido;
			$this->sapellido = $sapellido;
			$this->correo = $correo;
		}
		public function getPnombre(){
			return $this->pnombre;
		}
		public function setPnombre($pnombre){
			$this->pnombre = $pnombre;
		}
		public function getSnombre(){
			return $this->snombre;
		}
		public function setSnombre($snombre){
			$this->snombre = $snombre;
		}
		public function getPapellido(){
			return $this->papellido;
		}
		public function setPapellido($papellido){
			$this->papellido = $papellido;
		}
		public function getSapellido(){
			return $this->sapellido;
		}
		public function setSapellido($sapellido){
			$this->sapellido = $sapellido;
		}
		public function getCorreo(){
			return $this->correo;
		}
		public function setCorreo($correo){
			$this->correo = $correo;
		}
		public function __toString(){
			return "Pnombre: " . $this->pnombre . 
				" Snombre: " . $this->snombre . 
				" Papellido: " . $this->papellido . 
				" Sapellido: " . $this->sapellido . 
				" Correo: " . $this->correo;
		}
		public function guardarEmpleado($conexion)
          { $consulta = sprintf("INSERT INTO persona(pnombre,snombre,papellido,sapellido,correo)
          	VALUES ('%s','%s','%s','%s','%s')",
          	$conexion->antiInyeccion($this->pnombre),
            $conexion->antiInyeccion($this->snombre),
            $conexion->antiInyeccion($this->papellido),
            $conexion->antiInyeccion($this->sapellido),
            $conexion->antiInyeccion($this->correo)
          );
          //echo $consulta;
          $resultado = $conexion->ejecutarconsulta($consulta);
          echo $consulta;
          }
	}
?>