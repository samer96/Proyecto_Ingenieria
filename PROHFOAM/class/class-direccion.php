<?php
	class Direccion{
		private $ciudad;
		private $colonia;
		private $calle;
		private $bloque;
		private $numero_casa;
		public function __construct($ciudad,
					$colonia,
					$calle,
					$bloque,
					$numero_casa){
			$this->ciudad = $ciudad;
			$this->colonia = $colonia;
			$this->calle = $calle;
			$this->bloque = $bloque;
			$this->numero_casa = $numero_casa;
		}
		public function getCiudad(){
			return $this->ciudad;
		}
		public function setCiudad($ciudad){
			$this->ciudad = $ciudad;
		}
		public function getColonia(){
			return $this->colonia;
		}
		public function setColonia($colonia){
			$this->colonia = $colonia;
		}
		public function getCalle(){
			return $this->calle;
		}
		public function setCalle($calle){
			$this->calle = $calle;
		}
		public function getBloque(){
			return $this->bloque;
		}
		public function setBloque($bloque){
			$this->bloque = $bloque;
		}
		public function getNumero_casa(){
			return $this->numero_casa;
		}
		public function setNumero_casa($numero_casa){
			$this->numero_casa = $numero_casa;
		}
		public function __toString(){
			return "Ciudad: " . $this->ciudad . 
				" Colonia: " . $this->colonia . 
				" Calle: " . $this->calle . 
				" Bloque: " . $this->bloque . 
				" Numero_casa: " . $this->numero_casa;
		}
		public function guardarDireccion($conexion)
          { $consulta = sprintf("INSERT INTO direccion(ciudad,colonia,calle,bloque,numero_casa)
          	VALUES ('%s','%s','%s','%s','%s')",
            $conexion->antiInyeccion($this->ciudad),
            $conexion->antiInyeccion($this->colonia),
            $conexion->antiInyeccion($this->calle),
            $conexion->antiInyeccion($this->bloque),
            $conexion->antiInyeccion($this->numero_casa)
          );
          echo $consulta;
          $resultado = $conexion->ejecutarconsulta($consulta);
          }
	}
?>