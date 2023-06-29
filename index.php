<?php
    include ("registrar.php");

    require ('conexion.php');
    $query = "SELECT id_region, nombre_region FROM regiones";
    $resultado = $conn->query($query);

    require ('conexion.php');
    $queryCa = "SELECT id_candidato, nombre_candidato FROM candidatos";
    $resultadoCa = $conn->query($queryCa);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Votacion</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#cbx_region").change(function() {
                var id_region = $(this).val();
                $.post("getComunas.php", { id_region: id_region }, function(data) {
                    $("#cbx_comuna").html(data);
                });
            });
        });
    </script>
</head>
<body>

    <form method="post">
        
        <h2>Formulario de Votacion</h2>

        <div class="input-wrapper">
            <label for="name">Nombre y Apellido:</label>
            <input type="text" name="name" required>
        </div>

        <div class="input-wrapper">
            <label for="alias">Alias:</label>
            <input type="text" name="alias">
        </div>

        <div class="input-wrapper">
            <label for="rut">Rut:</label>
            <input type="id" name="rut">
        </div>

        <div class="input-wrapper">
            <label for="email">Email:</label>
            <input type="email" name="email">
        </div>

        <div>
            Selecciona Región:
            <select id="cbx_region" name="cbx_region">
                <option value="0">Seleccionar Región</option>
                <?php while ($row = $resultado->fetch_assoc()) { ?>
                    <option value="<?php echo $row['id_region']; ?>"><?php echo $row['nombre_region']; ?></option>
                <?php } ?>
            </select>           
        </div>

        <div>
            Selecciona Comuna:
            <select id="cbx_comuna" name="cbx_comuna">
            </select>
        </div>

        <div>
            Candidato:
            <select id="cbx_candidato" name="cbx_candidato">
                <option value="0">Seleccionar Candidato</option>
                <?php while ($row = $resultadoCa->fetch_assoc()) { ?>
                    <option value="<?php echo $row['id_candidato']; ?>"><?php echo $row['nombre_candidato']; ?></option>
                <?php } ?>
            </select>
        </div>

        <div>
            <span>¿Cómo se enteró de nosotros?</span>
            <input type="checkbox" name="opciones[]" value=1>Web
            <input type="checkbox" name="opciones[]" value=2>TV
            <input type="checkbox" name="opciones[]" value=3>Redes Sociales
            <input type="checkbox" name="opciones[]" value=4>Amigo
        </div>

        <input class="btn" type="submit" name="registro" value="Votar">

    </form>
       
</body>
</html>
