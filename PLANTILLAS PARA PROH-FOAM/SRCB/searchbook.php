<!DOCTYPE html>
<html lang="es">
<head>
    <title>Buscar libro</title>
    <?php
        session_start();
        $LinksRoute="./";
        include './inc/links.php'; 
    ?>
</head>
<body>
    <?php 
        include './library/configServer.php';
        include './library/consulSQL.php';
        include './process/SecurityUser.php';
        include './inc/NavLateral.php';
    ?>
    <div class="content-page-container full-reset custom-scroll-containers">
        <?php 
            include './inc/NavUserInfo.php'; 
        ?>
        <div class="container">
            <div class="page-header">
              <h1 class="all-tittles">Sistema bibliotecario <small>Busqueda de libro</small></h1>
            </div>
        </div>
        <br><br><br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-md-8 col-md-offset-2">
                    <p class="lead">
                        Esta opción no está disponible en la versión de prueba por favor contacte al desarrollador para comprar el código fuente completo, así poder desbloquear esta funcionalidad y muchas más.
                    </p>
                    <p class="lead">
                        Prueba la versión completa aqui: <a href="https://goo.gl/5lH1yx" target="_blank">Haz clic aquí para probar versión completa</a>
                    </p>
                    <p class="lead">
                        Contactar al desarrollador: <br>
                        <a href="https://www.facebook.com/CarlosAlfaroES/" target="_blank"><i class="zmdi zmdi-facebook zmdi-hc-fw"></i> En Facebook</a><br>
                        <a href="https://www.youtube.com/c/CarlosAlfaro007" target="_blank"><i class="zmdi zmdi-youtube zmdi-hc-fw"></i> En YouTube</a>
                    </p>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="modal fade" tabindex="-1" role="dialog" id="ModalHelp">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center all-tittles">ayuda del sistema</h4>
                </div>
                <div class="modal-body">
                    <?php include './help/help-searchbook.php'; ?>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="zmdi zmdi-thumb-up"></i> &nbsp; De acuerdo</button>
                </div>
            </div>
          </div>
        </div>
        <?php include './inc/footer.php'; ?>
    </div>
</body>
</html>