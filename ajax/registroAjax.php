<?php
    $peticionAjax=true;
    require_once "../modelos/registroModelo.php";

   
    $usuario=new Usuario();
    
    $idusuario=isset($_POST["idusuario"])? limpiarCadena($_POST["idusuario"]):"";
    $idcurso=isset($_POST["idcurso"])? limpiarCadena($_POST["idcurso"]):"";
    $nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
    $apellido=isset($_POST["apellido"])? limpiarCadena($_POST["apellido"]):"";
    $nickname=isset($_POST["nickname"])? limpiarCadena($_POST["nickname"]):"";
    $password=isset($_POST["password"])? limpiarCadena($_POST["password"]):"";
    $password1=isset($_POST["password2"])? limpiarCadena($_POST["password2"]):"";
    
    if ($password!=$password1) {
        $alerta=[
            "Alerta"=>"simple",
            "Titulo"=>"Ocurrio un error inesperado",
            "Texto"=>"La contraseñas no coinciden, por favor intente nuevamente",
            "Tipo"=>"error"
        ];
        return mainModel::sweet_alert($alerta);
    }
    switch ($_GET["op"]) {
        case 'guardaryeditar':
    
            if (empty($idusuario)) {
                $rspta=$usuario->insertar($idcurso, $nombre, $apellido, $nickname, $password);
                echo $rspta ? "Usuario registrado" : "Usuario no se pudo registrar";
            } else {
                $rspta=$usuario->editar($idusuario, $idcurso, $nombre, $apellido, $nickname, $password);
                echo $rspta ? "Usuario actualizado" : "Usuario no se pudo actualizar";
            }
        break;
    
        case 'desactivar':
            $rspta=$usuario->desactivar($idusuario);
            echo $rspta ? "Usuario desactivado" : "Usuario no se pudo desactivar";
        break;
    
        case 'activar':
            $rspta=$usuario->activar($idusuario);
            echo $rspta ? "Usuario activado" : "Usuario no se pudo activar";
        break;
    
        case 'mostrar':
            $rspta=$usuario->mostrar($idusuario);
            //Codificar el resultado utilizando json
            echo json_encode($rspta);
        break;
    
        case 'listar':
            $rspta=$usuario->listar();
            //Vamos a declarar un array
            $data= array();
    
            while ($reg=$rspta->fetch_object()) {
                $data[]=array(
                    "0"=>($reg->condicion)?'<button class="btn btn-warning" onclick="mostrar('.$reg->idusuario.')"><i class="zmdi zmdi-edit"></i></button>'.
                        ' <button class="btn btn-danger" onclick="desactivar('.$reg->idusuario.')"><i class="zmdi zmdi-close"></i></button>':
                        '<button class="btn btn-warning" onclick="mostrar('.$reg->idusuario.')"><i class="zmdi zmdi-edit"></i></button>'.
                        ' <button class="btn btn-primary" onclick="activar('.$reg->idusuario.')"><i class="zmdi zmdi-check"></i></button>',
                    "1"=>$reg->nombre,
                    "2"=>$reg->apellido,
                    "3"=>$reg->nickname,
                    "4"=>($reg->condicion)?'<span class="label bg-green">Activado</span>':
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
    
        case "selectCurso":
            require_once "../modelos/cursoModelo.php";
            $curso = new Curso();
    
            $rspta = $curso->select();
    
            while ($reg = $rspta->fetch_object()) {
                echo '<option value=' . $reg->idcurso . '>' . $reg->descripcion . '</option>';
            }
        break;
    } 