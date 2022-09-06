<?php 
	class vistasModelo{
		public function obtener_vistas_modelo($vistas){
			$listaBlanca=["bachiller","home","materia","profes","login","registro"];
			if(in_array($vistas, $listaBlanca)){
				if(is_file("./vistas/contenidos/".$vistas."-view.php")){
					$contenido="./vistas/contenidos/".$vistas."-view.php";
				}else{
					$contenido="login";
				}
			}elseif($vistas=="registro"){
				$contenido="registro";
			}elseif($vistas=="login"){
				$contenido="login";
			}elseif($vistas=="index"){
				$contenido="login";
			}else{
				$contenido="404";
			}
			return $contenido;
		}
	}