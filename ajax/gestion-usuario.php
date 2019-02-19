<?php
   include ('../conexion/class_conexion.php');
   $conexion  = new Conexion();
   switch ($_GET["accion"]) {
   	case 'crear-empleado':
   		include ('../class/class-empleado.php');
         $empleado = new empleado($_POST["txt-pnombre"],
                              $_POST["txt-snombre"],
                              $_POST["txt-papellido"],
                              $_POST["txt-sapellido"],
                              $_POST["txt-correo"]
                           );
         $empleado->guardarEmpleado($conexion);

   		break;
         case 'crear-direccion':
         include ('../class/class-direccion.php');
         $direccion = new Direccion(
                              $_POST["txt-ciudad"],
                              $_POST["txt-colonia"],
                              $_POST["txt-calle"],
                              $_POST["txt-bloque"],
                              $_POST["txt-numero_casa"]
                           );
         $direccion->guardarDireccion($conexion);
         break;
   	default:
   		# code...
   		break;
   }
   
?>