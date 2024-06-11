<?php

header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "phantomsql";

//  Crear conexión
$conexion = new mysqli($servername, $username, $password, $dbname);

//  Verificar conexión
if ($conexion->connect_error) {
    $response = array("message"=> "Conexión fallida: " . $conexion->connect_error);
    echo json_encode($response);
    exit();
}

// Obtener datos del formulario
$email = $_POST['email'];

// Validar email
if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
    $response = array("message"=> "El email no es valido");
    echo json_encode($response);
    exit();
} else {

    // Preparar y ejecutar la consulta SQL
    $sql = "INSERT INTO emails (email) VALUES ('$email')";

    if ($conexion->query($sql) === TRUE) {
        $response = array("message" => "El email se ha enviado correctamente");
    } else {
        $response = array("message" => "Error: " . $sql . "<br>" . $conexion->error);
    }
}   

// Cerrar la conexión
$conexion->close();

// Devolver la respuesta en formato JSON
echo json_encode($response);
?>
        