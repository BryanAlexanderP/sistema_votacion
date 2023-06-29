<?php
    if (isset($_POST['registro'])) {
        // Obtener los valores del formulario
        $nombre = $_POST['name'];
        $alias = $_POST['alias'];
        $rut = $_POST['rut'];
        $email = $_POST['email'];
        $id_region = $_POST['cbx_region'];
        $id_comuna = $_POST['cbx_comuna'];
        $id_candidato = $_POST['cbx_candidato'];
        $medios = isset($_POST['opciones']) ? $_POST['opciones'] : array();
        $fecha = date('Y-m-d'); // Obtener la fecha actual

        echo implode($medios);
        // Insertar los datos en la tabla "datos"
        $query = "INSERT INTO datos (nombre, alias, rut, email, id_region, id_comuna, id_candidato, id_medio1, id_medio2, fecha) 
                  VALUES ('$nombre', '$alias', '$rut', '$email', '$id_region', '$id_comuna', '$id_candidato', ";

        if (count($medios) >= 1) {
            $query .= "'" . $medios[0] . "', ";
        } else {
            $query .= "NULL, ";
        }

        if (count($medios) >= 2) {
            $query .= "'" . $medios[1] . "', ";
        } else {
            $query .= "NULL, ";
        }

        $query .= "'$fecha')";

        // Ejecutar la consulta
        require('conexion.php');
        if ($conn->query($query) === TRUE) {
            echo "Datos insertados correctamente";
        } else {
            echo "Error al insertar los datos: " . $conn->error;
        }

        // Cerrar la conexión
        $conn->close();
    }
?>
