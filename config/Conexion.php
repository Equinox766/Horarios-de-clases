<?php

	if($peticionAjax){
		require_once "../config/global.php";
	}else{
		require_once "./config/global.php";
	}

	class mainModel{

		protected function conectar(){
			$enlace = new PDO(SGDB,DB_USERNAME,DB_PASSWORD);
			return $enlace;
		}

		protected function ejecutar_consulta_simple($consulta){
			$respuesta=self::conectar()->prepare($consulta);
			$respuesta->execute();
			return $respuesta;
		}

		protected function agregar_cuenta($datos){
			$sql=self::conectar()->prepare("INSERT INTO 
			usuario(nombre,apellido,nickname,password,foto,idcurso,idturno) 
			VALUES(:nombre,:apellido,:nickname,:password,:foto,:idcurso,:idturno)");
			$sql->bindParam("nombre",$datos["nombre"]);
			$sql->bindParam("apellido",$datos["apellido"]);
			$sql->bindParam("nickname",$datos["nickname"]);
			$sql->bindParam("password",$datos["password"]);
			$sql->bindParam("foto",$datos["foto"]);
			$sql->bindParam("idcurso",$datos["idcurso"]);
			$sql->bindParam("idturno",$datos["idturno"]);
			$sql->execute();
			return $sql;
		}

		protected function eliminar_cuenta($codigo){
			$sql=self::conectar()->prepare("DELETE FROM usuarios WHERE idusuario=:idusuario");
			$sql->bindParam(":idusuario", $codigo);
			$sql->execute();
			return $sql;
		}

		public function encryption($string){
			$output=FALSE;
			$key=hash('sha256', SECRET_KEY);
			$iv=substr(hash('sha256', SECRET_IV), 0, 16);
			$output=openssl_encrypt($string, METHOD, $key, 0, $iv);
			$output=base64_encode($output);
			return $output;
		}
		protected function decryption($string){
			$key=hash('sha256', SECRET_KEY);
			$iv=substr(hash('sha256', SECRET_IV), 0, 16);
			$output=openssl_decrypt(base64_decode($string), METHOD, $key, 0, $iv);
			return $output;
		}

		protected function generar_codigo_aleatorio($letra, $longitud, $num){
			for($i=1;$i<=$longitud; $i++){
				$numero = rand(0,9);
				$letra.= $numero; 
			}
			return $letra.$num;
		}
		protected function limpiar_cadena($cadena){
			$cadena=trim($cadena);
			$cadena=stripcslashes($cadena);
			$cadena=str_ireplace("<script>", "", $cadena);
			$cadena=str_ireplace("<\script>", "", $cadena);
			$cadena=str_ireplace("<script src", "", $cadena);
			$cadena=str_ireplace("<script type", "", $cadena);
			$cadena=str_ireplace("SELECT * FROM", "", $cadena);
			$cadena=str_ireplace("DELETE FROM", "", $cadena);
			$cadena=str_ireplace("INSERT INTO", "", $cadena);
			$cadena=str_ireplace("--", "", $cadena);
			$cadena=str_ireplace("^", "", $cadena);
			$cadena=str_ireplace("[", "", $cadena);
			$cadena=str_ireplace("]", "", $cadena);
			$cadena=str_ireplace("==", "", $cadena);
			return $cadena;
		}

		protected function sweet_alert($datos){
			if($datos['Alerta']=="simple"){
				$alerta="
				<script>
					swal(
						'".$datos['Titulo']."',
						'".$datos['Texto']."',
						'".$datos['Tipo']."'
					);
				<\script>
				";
			}elseif($datos['Alerta']=="recargar"){
				$alerta="
				<script>
					swal({
						title: '".$datos['Titulo']."',
						text: '".$datos['Texto']."',
						type: '".$datos['Texto']."',
						confirmButtonText: 'Aceptar'
					}).then(function () {
						location.reload();
					});
				<\script>
				";
			}elseif($datos['Alerta']=="limpiar"){
				$alerta="
				<script>
					swal({
						title: '".$datos['Titulo']."',
						text: '".$datos['Texto']."',
						type: '".$datos['Texto']."',
						confirmButtonText: 'Aceptar'
					}).then(function () {
						$('.FormularioAjax')[0].reset();
					});
				<\script>
				";
			}
			return $alerta;
		}
	}

$conexion = new mysqli(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME);

mysqli_query( $conexion, 'SET NAMES "'.DB_ENCODE.'"');

//Si tenemos un posible error en la conexión lo mostramos
if (mysqli_connect_errno())
{
	printf("Falló conexión a la base de datos: %s\n",mysqli_connect_error());
	exit();
}

if (!function_exists('ejecutarConsulta'))
{
	function ejecutarConsulta($sql)
	{
		global $conexion;
		$query = $conexion->query($sql);
		return $query;
	}

	function ejecutarConsultaSimpleFila($sql)
	{
		global $conexion;
		$query = $conexion->query($sql);		
		$row = $query->fetch_assoc();
		return $row;
	}

	function ejecutarConsulta_retornarID($sql)
	{
		global $conexion;
		$query = $conexion->query($sql);		
		return $conexion->insert_id;			
	}

	function limpiarCadena($str)
	{
		global $conexion;
		$str = mysqli_real_escape_string($conexion,trim($str));
		return htmlspecialchars($str);
	}
}
?>