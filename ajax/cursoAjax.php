<?php 
require_once "../modelos/cursoModelo.php";

$curso=new Curso();

$idcurso=isset($_POST["idcurso"])? limpiarCadena($_POST["idcurso"]):"";
$descripcion=isset($_POST["descripcion"])? limpiarCadena($_POST["descripcion"]):"";

switch ($_GET["op"]){
	case 'guardaryeditar':
		if (empty($idcurso)){
			$rspta=$curso->insertar($descripcion);
			echo $rspta ? "Curso registrada" : "Curso no se pudo registrar";
		}
		else {
			$rspta=$curso->editar($idcurso,$descripcion);
			echo $rspta ? "Curso actualizada" : "Curso no se pudo actualizar";
		}
	break;

	case 'desactivar':
		$rspta=$curso->desactivar($idcurso);
 		echo $rspta ? "Curso Desactivada" : "Curso no se puede desactivar";
	break;

	case 'activar':
		$rspta=$curso->activar($idcurso);
 		echo $rspta ? "Curso activada" : "Curso no se puede activar";
	break;

	case 'mostrar':
		$rspta=$curso->mostrar($idcurso);
 		//Codificar el resultado utilizando json
 		echo json_encode($rspta);
	break;

	case 'listar':
		$rspta=$curso->listar();
 		//Vamos a declarar un array
 		$data= Array();

 		while ($reg=$rspta->fetch_object()){
 			$data[]=array(
 				"0"=>($reg->condicion)?'<button class="btn btn-warning" onclick="mostrar('.$reg->idcurso.')"><i class="fa fa-pencil"></i></button>'.
 					' <button class="btn btn-danger" onclick="desactivar('.$reg->idcurso.')"><i class="fa fa-close"></i></button>':
 					'<button class="btn btn-warning" onclick="mostrar('.$reg->idcurso.')"><i class="fa fa-pencil"></i></button>'.
 					' <button class="btn btn-primary" onclick="activar('.$reg->idcurso.')"><i class="fa fa-check"></i></button>',
 				"1"=>$reg->descripcion,
 				"2"=>($reg->condicion)?'<span class="label bg-green">Activado</span>':
 				'<span class="label bg-red">Desactivado</span>'
 				);
 		}
 		$results = array(
 			"sEcho"=>1, //Información para el datatables
 			"iTotalRecords"=>count($data), //enviamos el total registros al datatable
 			"iTotalDisplayRecords"=>count($data), //enviamos el total registros a visualizar
 			"aaData"=>$data);
 		echo json_encode($results);

	break;
}
?>