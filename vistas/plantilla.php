<!DOCTYPE html>
<html lang="es">
<head>
	<title>Inicio</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="<?php echo SERVERURL; ?>public/css/main.css">
</head>
<body>
	<?php
		
		$peticionAjax=false;

		require_once "./controladores/vistasControlador.php";

		$vt = new vistasControlador();
		$vistasR = $vt->obtener_vistas_controlador();

		if($vistasR=="login" || $vistasR=="404" || $vistasR=="registro"):
			if($vistasR=="login"){
				require_once "./vistas/contenidos/login-view.php";
			}elseif($vistasR=="404"){
				require_once "./vistas/contenidos/404-view.php";
			}else{
				require_once "./vistas/contenidos/registro-view.php";
			}
		else:
			session_start();
	
	?>

	<!-- SideBar -->
	<?php
		if($vistasR=="registro"):
			require_once "vistas/contenidos/registro-view.php";
		else:
			require "modulos/navlateral.php";
		endif;
    ?>

	<!-- Content page-->
	<section class="full-box dashboard-contentPage">
		<!-- NavBar -->
		<?php
			if($vistasR=="registro"):
				require_once "vistas/contenidos/registro-view.php";
			else:
				require "modulos/navbar.php";
			endif;
            
		?>
		
		
		<!-- Content page -->
		<br>
		
		<?php
			if($vistasR=="registro"):
				require_once "vistas/contenidos/registro-view.php";
			else:
				require_once $vistasR;
			endif;
        ?>
		
	</section>

	<?php
		endif;
	?>
	<!-- Dialog help -->
	<div class="modal fade" tabindex="-1" role="dialog" id="Dialog-Help">
	  	<div class="modal-dialog" role="document">
		    <div class="modal-content">
			    <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			    	<h4 class="modal-title">Help</h4>
			    </div>
			    <div class="modal-body">
			        <p>
			        	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt beatae esse velit ipsa sunt incidunt aut voluptas, nihil reiciendis maiores eaque hic vitae saepe voluptatibus. Ratione veritatis a unde autem!
			        </p>
			    </div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-primary btn-raised" data-dismiss="modal"><i class="zmdi zmdi-thumb-up"></i> Ok</button>
		      	</div>
		    </div>
	  	</div>
	</div>

	<!--====== Scripts -->
	<?php
        require "modulos/scripts.php";
    ?>
		
</body>
</html>