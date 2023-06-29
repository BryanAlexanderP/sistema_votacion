<?php

function validarRut($rut) {
    $rut = preg_replace('/[^k0-9]/i', '', $rut);
    $dv  = substr($rut, -1);
    $numero = substr($rut, 0, strlen($rut)-1);
    $i = 2;
    $suma = 0;
    foreach(array_reverse(str_split($numero)) as $v) {
        if($i==8) {
            $i = 2;
        }
        $suma += $v * $i;
        ++$i;
    }
    $dvr = 11 - ($suma % 11);
    if($dvr == 11) {
        $dvr = 0;
    }
    if($dvr == 10) {
        $dvr = 'K';
    }
    if($dvr == strtoupper($dv)) {
        return true;
    } else {
        return false;
    }
}

    if (isset($_POST['registro'])) {
        $nombre = $_POST['name'];
        $alias = $_POST['alias'];
        $rut = $_POST['rut'];
        $email = $_POST['email'];
        $id_region = $_POST['cbx_region'];
        $id_comuna = $_POST['cbx_comuna'];
        $id_candidato = $_POST['cbx_candidato'];
        $medios = isset($_POST['opciones']) ? $_POST['opciones'] : array();
        $fecha = date('Y-m-d'); 

        if (strlen($alias) < 5 || !preg_match('/[a-zA-Z]/', $alias) || !preg_match('/[0-9]/', $alias)) {
            echo "El campo Alias debe tener al menos 5 caracteres y contener letras y números.";
            exit; 
        }

        if (!validarRut($rut)) {
            echo "El campo Rut no tiene un formato válido.";
            exit; 
        }

        echo implode($medios);

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

        require('conexion.php');
        if ($conn->query($query) === TRUE) {
            echo "Datos insertados correctamente";
        } else {
            echo "Error al insertar los datos: " . $conn->error;
        }

        $conn->close();
    }
?>
