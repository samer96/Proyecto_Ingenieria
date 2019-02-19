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

$usuarioname=$_POST['Usuario'];
echo $usuarioname;
$hola=mysqli_query($conn,"SELECT usuario FROM Empleado where usuario='$usuarioname'");

$row = mysqli_fetch_array($hola,MYSQLI_ASSOC);

echo $row["usuario"];
mysqli_close($conn);


 ?>