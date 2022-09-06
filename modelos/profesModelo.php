<?php 
//Incluímos inicialmente la conexión a la base de datos
if($peticionAjax){
	require_once "../config/Conexion.php";
}else{
	require_once "./config/Conexion.php";
}
Class Profesores
{
	//Implementamos nuestro constructor
	public function __construct()
	{

	}

	//Implementamos un método para insertar registros
	public function insertar($descripcion)
	{
		$sql="INSERT INTO curso (descripcion,condicion)
		VALUES ('$descripcion','1')";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para editar registros
	public function editar($idcurso,$descripcion)
	{
		$sql="UPDATE curso SET descripcion='$descripcion' WHERE idcurso='$idcurso'";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para desactivar Cursos
	public function desactivar($idcurso)
	{
		$sql="UPDATE curso SET condicion='0' WHERE idcurso='$idcurso'";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para activar Cursos
	public function activar($idcurso)
	{
		$sql="UPDATE curso SET condicion='1' WHERE idcurso='$idcurso'";
		return ejecutarConsulta($sql);
	}

	//Implementar un método para mostrar los datos de un registro a modificar
	public function mostrar($idcurso)
	{
		$sql="SELECT * FROM curso WHERE idcurso='$idcurso'";
		return ejecutarConsultaSimpleFila($sql);
	}

	//Implementar un método para listar los registros
	public function listar()
	{
		$sql="SELECT * FROM curso";
		return ejecutarConsulta($sql);		
	}
	//Implementar un método para listar los registros y mostrar en el select
	public function select()
	{
		$sql="SELECT * FROM curso where condicion=1";
		return ejecutarConsulta($sql);		
	}
}

?>