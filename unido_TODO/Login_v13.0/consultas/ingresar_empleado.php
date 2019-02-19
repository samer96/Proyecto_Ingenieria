<?php 
$servername = "localhost";
$database = "mydb";
$username = "josue";
$password = "legolas13";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
$calle=(int)$_POST['calle'];
$bloque=(int)$_POST['bloque'];
$casa=(int)$_POST['casa'];

mysqli_query($conn,"INSERT INTO Direccion(ciudad,colonia,calle,bloque,numerocasa) VALUES('$_POST[ciudad]','$_POST[colonia]',$calle,$bloque,$casa)");
$iddireccion=mysqli_query($conn,"SELECT MAX(idDireccion) FROM Direccion");
if ($row = mysqli_fetch_row($iddireccion)) {
$id = trim($row[0]);
}

mysqli_query($conn,"INSERT INTO PERSONA(idDireccion,pNombre,sNombre,pApellido,sApellido,correoelectronico) VALUES($id,'$_POST[Pnombre]','$_POST[Snombre]','$_POST[Papellido]','$_POST[Sapellido]','$_POST[Correo]')");
$idpersona=mysqli_query($conn,"SELECT MAX(idPersona) FROM persona");
if ($row = mysqli_fetch_row($idpersona)) {
$id = trim($row[0]);
}
mysqli_query($conn,"INSERT INTO Empleado(idPersona,idRoles,fechaNombramiento,usuario,contrasena) VALUES($id,2,'$_POST[fecha]','$_POST[usuario]','$_POST[password]')");
mysqli_query($conn,"INSERT INTO telefono(idPersona,numero) VALUES($id,'$_POST[Celular]')");




mysqli_close($conn);

header('Location: ../registrar (1).html');
 ?>