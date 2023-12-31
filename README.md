# Formulario de Votación

Este es un formulario de votación desarrollado en PHP y MySQL. Permite a los usuarios seleccionar una región, una comuna, un candidato y también indicar cómo se enteraron del formulario.

## Características

- El formulario recopila información del usuario, incluyendo nombre, alias, RUT, email, región, comuna, candidato y medios de conocimiento.
- Al seleccionar una región, se cargan dinámicamente las comunas correspondientes a esa región a través de una petición AJAX.
- Los datos del formulario se insertan en la tabla "datos" de la base de datos MySQL.

## Requisitos

- Servidor web (por ejemplo, Apache).
- PHP 5.6 o superior.
- MySQL.

## Uso

- Coloca todos los archivos en la carpeta de tu servidor web.
- Accede al formulario a través de tu navegador web, por ejemplo: http://localhost/formulario-votacion/.
-  Complete los campos del formulario, seleccione una región, una comuna, un candidato y los medios de conocimiento.
- Haz clic en el botón "Votar" para enviar el formulario.
- Los datos serán insertados en la tabla "datos" de la base de datos

## Configuración de la base de datos

1. Crea una base de datos en MySQL para almacenar los datos. Restaurar backup del proyecto (dump-bd.sql).
