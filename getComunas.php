<?php
    require('conexion.php');

    if (isset($_POST['id_region'])) {
        $id_region = $_POST['id_region'];

        $query = "SELECT id_comuna, nombre_comuna FROM comunas WHERE region_id = '$id_region'";
        $resultado = $conn->query($query);

        if ($resultado->num_rows > 0) {
            while ($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id_comuna'] . '">' . $row['nombre_comuna'] . '</option>';
            }
        } else {
            echo '<option value="0">No hay comunas disponibles</option>';
        }
    } else {
        echo '<option value="0">Seleccione una región primero</option>';
    }
?>
