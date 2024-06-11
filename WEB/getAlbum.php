<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "phantomsql";
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$cancionId = $_GET['cancionId'];

// Obtener detalles del álbum y canciones del álbum
$sql = "SELECT obras.id AS albumId, obras.nombre AS albumNombre, obras.portada, obras.duracion, obras.fechaSalida, obras.tipo
        FROM cancion 
        JOIN obras ON cancion.idAlbum = obras.id 
        WHERE cancion.id = $cancionId";
        
$albumResult = $conn->query($sql);

if ($albumResult->num_rows > 0) {
    $albumData = $albumResult->fetch_assoc();
    $albumId = $albumData['albumId'];
    $albumNombre = $albumData['albumNombre'];
    $albumPortada = $albumData['portada'];

    // Obtener todas las canciones del álbum
    $sqlCanciones = "SELECT id, nombre FROM cancion WHERE idAlbum = $albumId";
    $cancionesResult = $conn->query($sqlCanciones);

    echo "<div class='album-details'>";
    echo "<h2>$albumNombre</h2>";
    echo "<img src='$albumPortada' class='album-portada img-fluid' alt='Portada del álbum'>";
    echo "<ul class='list-group''>";
    
    while ($cancion = $cancionesResult->fetch_assoc()) {
        $activeClass = $cancion['id'] == $cancionId ? 'active' : '';
        echo "<li class='list-group-item $activeClass'  style='background-color: #1a1a1a;'>" . htmlspecialchars($cancion['nombre']) . "</li>";
    }
    
    echo "</ul>";
    echo "</div>";
} else {
    echo "No se encontraron detalles del álbum.";
}

$conn->close();
?>