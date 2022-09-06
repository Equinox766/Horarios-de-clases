<?php 
//Incluímos inicialmente la conexión a la base de datos
if($peticionAjax){
	require_once "../config/Conexion.php";
}else{
	require_once "./config/Conexion.php";
}

Class Usuario
{
	//Implementamos nuestro constructor
	public function __construct()
	{

	}

	//Implementamos un método para insertar registros
	public function insertar($idcurso,$nombre,$apellido,$nickname,$password)
	{
		$sql="INSERT INTO usuario (idcurso,nombre,apellido,nickname,password,condicion)
		VALUES ('$idcurso','$nombre','$apellido','$nickname','$password','1')";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para editar registros
	public function editar($idusuario,$idcurso,$nombre,$apellido,$nickname,$password)
	{
		$sql="UPDATE usuario SET idusuario='$idusuario',idcurso='$idcurso',nombre='$nombre',apellido='$apellido',nickname='$nickname',password='$password'
		 WHERE idusuario='$idusuario'";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para desactivar registros
	public function desactivar($idusuario)
	{
		$sql="UPDATE usuario SET condicion='0' WHERE idusuario='$idusuario'";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para activar registros
	public function activar($idusuario)
	{
		$sql="UPDATE usuario SET condicion='1' WHERE idusuario='$idusuario'";
		return ejecutarConsulta($sql);
	}

	//Implementar un método para mostrar los datos de un registro a modificar
	public function mostrar($idusuario)
	{
		$sql="SELECT * FROM usuario WHERE idusuario='$idusuario'";
		return ejecutarConsultaSimpleFila($sql);
	}

	//Implementar un método para listar los registros
	public function listar()
	{
		$sql="SELECT a.idusuario,a.idcurso,b.descripcion as curso,a.nombre,a.apellido,a.nickname,a.password,a.condicion FROM usuario a INNER JOIN curso b ON a.idcurso=c.idcurso";
		return ejecutarConsulta($sql);
	}

	//Implementar un método para listar los registros activos
	public function listarActivos()
	{
		$sql="SELECT a.idusuarios,a.idcurso,c.descripcion as curso,a.nombre,a.apellido,a.nickname,a.password,a.condicion FROM usuario a INNER JOIN curso c ON a.idcurso=c.idcurso WHERE a.condicion='1'";
		return ejecutarConsulta($sql);
	}
}

?>
