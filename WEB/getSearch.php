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

// Obtener la consulta de búsqueda del formulario
$busqueda = '';
if (isset($_GET['busqueda'])) {
    $busqueda = $conn->real_escape_string($_GET['busqueda']);
}
    // Consulta para buscar coincidencias
    $sql = "SELECT 'cancion' AS tipo, cancion.id, cancion.nombre, obras.portada, 1 AS orden 
            FROM cancion
                JOIN obras 
                ON cancion.idAlbum = obras.id
            WHERE cancion.nombre LIKE '%$busqueda%'
            UNION
            SELECT 'obra' AS tipo, obras.id, obras.nombre, obras.portada, 2 AS orden 
            FROM obras 
            WHERE obras.nombre LIKE '%$busqueda%'
            ORDER BY orden, id
            LIMIT 20";
    $result = $conn->query($sql);

    // Mostrar resultados
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<div class='col-md-3 text-center cancion-card' data-id='" . $row["id"] . "'>";

            $portada = htmlspecialchars($row["portada"], ENT_QUOTES | ENT_HTML5, 'UTF-8', false);
            echo "<img src='" . $portada . "' class='card-img-top' alt='Portada' style='width:200px'>";

            echo "<div class='card-body'>";
            if ($row["tipo"] == "obra") {
                echo "<h5 class='card-title'>Obra</h5>";
            } else {
                echo "<h5 class='card-title'>Canción</h5>";
            }
            echo "<p class='card-text text-center'>" . htmlspecialchars($row["nombre"]) . "</p>";
            echo "</div>";
            echo "</div>";
        }
    } else {
        echo "<div class='col-12'><p>No se encontraron resultados.</p></div>";
    }

?>