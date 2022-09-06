<!DOCTYPE html>
<html lang="es">
<head>
	<title>Registrarse</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="<?php echo SERVERURL; ?>public/css/main.css">
</head>
<body>

	<!-- Content page-->
		<!-- Content page -->
		<div class="container-fluid">
			<div class="page-header">
			  <h1 class="text-titles"><i class="zmdi zmdi-account-add"></i> Registro <small>Usuario</small></h1>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
				<div class="full-box tile-title text-center text-titles text-uppercase">
					Complete el formulario de registro
				</div>
				<br>
				<br>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="new">
							<div class="container-fluid">
								<div class="row">
									<div class="col-xs-12 col-md-10 col-md-offset-1">
									    <form name="formulario" id="formulario" method="POST">
									    	<div class="form-group label-floating">
											  <label class="control-label">Nombre</label>
											  <input type="hidden" name="idusuario" id="idusuario">
											  <input class="form-control" type="text" name="nombre" id="nombre">
											</div>
											<div class="form-group label-floating">
											  <label class="control-label">Apellido</label>
											  <input class="form-control" type="text" name="apellido" id="apellido">
											</div>
											<div class="form-group label-floating">
											  <label class="control-label">Usuario</label>
											  <input class="form-control" type="text" name="nickname" id="nickname">
											</div>
											<div class="form-group">
											<label class="control-label">Curso</label>
										  	<select id="idcurso" name="idcurso" class="form-control">
									          	
									        </select>
										
										        
											</div>
											<div class="form-group label-floating">
											  <label for="inputPassword" class="control-label">Contraseña</label>
											  <input type="password" class="form-control" name="password" id="password">
											</div>
											<div class="form-group label-floating">
											  <label for="inputPassword" class="control-label">Repita su Contraseña</label>
											  <input type="password" class="form-control" name="password2" id="password2">
											</div>
											
										    <p class="text-center">
												<button href="<?php echo SERVERURL; ?>index/" class="btn btn-info btn-raised btn-md"><i class="zmdi zmdi-floppy"></i> Guardar</button>
												<button onclick="cancelarform()" class="btn btn-danger btn-raised btn-md"><i class="zmdi zmdi-floppy"></i> Cancelar</button>
											</p>
											
									    </form>
									</div>
								</div>
							</div>
						</div>
	<!--====== Scripts -->
	<!--====== Scripts -->
    <script src="<?php echo SERVERURL; ?>public/js/jquery-3.1.1.min.js"></script>
	<script src="<?php echo SERVERURL; ?>public/js/sweetalert2.min.js"></script>
	<script src="<?php echo SERVERURL; ?>public/js/bootstrap.min.js"></script>
	<script src="<?php echo SERVERURL; ?>public/js/material.min.js"></script>
	<script src="<?php echo SERVERURL; ?>public/js/ripples.min.js"></script>
	<script src="<?php echo SERVERURL; ?>public/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="<?php echo SERVERURL; ?>public/js/main.js"></script>
	<script>
		$.material.init();
	</script>
	<script type="text/javascript" src="<?php echo SERVERURL; ?>vistas/scripts/registro.js"></script>
</body>
</html>