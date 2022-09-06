<?php 
//Ip de la pc servidor de base de datos
define("DB_HOST", "localhost");
//Nombre de Basa de Dato
define("DB_NAME", "SysHor");

//Usuario de la base de datos
define("DB_USERNAME", "root");

//Contraseña del usuario de db
define("DB_PASSWORD", "");

//Codificacion de los caracteres
define("DB_ENCODE", "utf8");

//Nombre del proyecto
define("PRO_NOMBRE", "HORARIO");

const SGDB="mysql:host=".DB_HOST.";dbname=".DB_NAME;

define('METHOD','AES-256-CBC');
define('SECRET_KEY','$HORARIOS@2019');
define('SECRET_IV','181019');
?>