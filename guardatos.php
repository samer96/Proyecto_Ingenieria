<?php
	require './conexion.php'
	$conectar=@mysql_conect('localhost','root','');
	if (!$conectar)
	{
		echo"Conexi&on no exitosa";
	}
	else {
		$base=mysql_select_db(base_proyecto);
		if(!$base)
		{
			echo"No se encontro la base de datos";
		}
	}
	//variables input data
	$pnombre=$_POST["prinombre"];
	$snombre=$_POST["segnombre"];
	$papellido=$_POST["priapellido"];
	$sapellido=$_POST["segapellido"];
	$email=$_POST["email"];
	$celular=$_POST["celular"];
	$ciudad=$_POST["ciudad"];
	$colonia=$_POST["colonia"];
	$calle=$_POST["calle"]
	$bloque=$_POST["bloque"];
	$casa=$_POST["ncasa"];
	//insert into database
	$sqlpersona="INSERT INTO Persona (pNombre, sNombre, pApellido, sApellido, correoElectronico) VALUES('$pnombre','$snombre','$papellido','$sapellido','$email')";
	$pejecutar=mysql_query(sqlpersona);
	$sqldireccion="INSERT INTO Direccion(ciudad, colonia, calle, bloque, numeroCasa) VALUES('$ciudad','$colonia','$calle','$bloque','$casa')";
	$dejecutar=mysql_query(sqldireccion);
		
?>