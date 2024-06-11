<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "phantomsql";
$conexion = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

// Obtener la fecha actual
$fecha_actual = date('Y-m-d');

// Consultar los datos de la tabla tour, limitando a las 10 filas futuras
$sql = "SELECT fecha, urlT, ubicacion, escenario, artistasInvitados 
        FROM tour 
        WHERE fecha >= '$fecha_actual' 
        ORDER BY fecha ASC 
        LIMIT 10";
$result = $conexion->query($sql);

// Inicializar un array para los resultados
$tours = array();

// Verificar si hay resultados y agregarlos al array
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $tours[] = $row;
    }
}

// Cerrar la conexión
$conexion->close();

// Devolver los resultados en formato JSON
header('Content-Type: application/json');
echo json_encode($tours);
?>