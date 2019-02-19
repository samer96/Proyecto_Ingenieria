<?php

	class Conexion{

		private $user='root';
		private $pass='';
		private $host='127.0.0.1';
		private $dataBase='mydb';
		private $port='3306';
		private $link;

		public function __construct(){
			$this->setConnection();			
		}

		public function setConnection(){
			$this->link = mysqli_connect($this->host, $this->user, $this->pass, $this->dataBase, $this->port);

			if (!$this->link){

				$mensaje = array(
					'status' => 500,
					'mensaje' => 'Conexion Fallida'
				);
				echo json_encode($mensaje);				
				exit;
				
			} else {
				//echo  "Conexion Exitosa!";;
			}
		}

		public function closeConnection(){
			mysqli_close($this->link);
		}

		public function executeQuery($sql){
			return mysqli_query($this->link, $sql);
		}

		public function getRow($resultado){
			return mysqli_fetch_array($resultado);
		}

		public function countRegisters($resultado){
			return mysqli_num_rows($resultado);
		}

		public function freeResult($resultado){
			mysqli_free_result($resultado);
		}

		public function getuser(){
			return $this->user;
		}

		public function getDataBase(){
			return $this->dataBase;
		}

		public function getError(){
			return mysqli_error($this->link);
		}
		public function setEscapa($cadena){
			return mysqli_real_escape_string($this->link,$cadena);
		}

	}
