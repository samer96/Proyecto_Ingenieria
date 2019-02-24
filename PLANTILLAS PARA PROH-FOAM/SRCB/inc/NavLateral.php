<?php
    if($LinksRoute=="../"){ $LinkRouteAdmin=""; }else{ $LinkRouteAdmin="./admin/"; }
?>
<div class="navbar-lateral full-reset">
    <div class="visible-xs font-movile-menu mobile-menu-button"></div>
    <div class="full-reset container-menu-movile custom-scroll-containers">
        <div class="logo full-reset all-tittles">
            <i class="visible-xs zmdi zmdi-close pull-left mobile-menu-button" style="line-height: 55px; cursor: pointer; padding: 0 10px; margin-left: 7px;"></i> 
            sistema bibliotecario
        </div>
        <div class="full-reset" style="background-color:#2B3D51; padding: 10px 0; color:#fff;">
            <figure>
                <img src="<?php echo $LinksRoute; ?>assets/img/logo.png" alt="Biblioteca" class="img-responsive center-box" style="width:55%;">
            </figure>
            <p class="text-center" style="padding-top: 15px;">Sistema Bibliotecario</p>
        </div>
        <div class="full-reset nav-lateral-list-menu">
            <ul class="list-unstyled">
                <?php
                    if($_SESSION['UserPrivilege']=='Student'||$_SESSION['UserPrivilege']=='Teacher'||$_SESSION['UserPrivilege']=='Personal'){
                        echo '<li><a href="catalog.php"><i class="zmdi zmdi-bookmark-outline zmdi-hc-fw"></i>&nbsp;&nbsp; Catálogo</a></li>';
                    }else if($_SESSION['UserPrivilege']=='Admin'){
                        echo '
                        <li><a href="'.$LinksRoute.'home.php"><i class="zmdi zmdi-home zmdi-hc-fw"></i>&nbsp;&nbsp; Inicio</a></li>
                        <li>
                            <div class="dropdown-menu-button"><i class="zmdi zmdi-case zmdi-hc-fw"></i>&nbsp;&nbsp; Administración <i class="zmdi zmdi-chevron-down pull-right zmdi-hc-fw"></i></div>
                            <ul class="list-unstyled">
                                <li><a href="'.$LinkRouteAdmin.'admininstitution.php"><i class="zmdi zmdi-balance zmdi-hc-fw"></i>&nbsp;&nbsp; Datos institución</a></li>
                                <li><a href="'.$LinkRouteAdmin.'adminprovider.php"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo proveedor</a></li>
                                <li><a href="'.$LinkRouteAdmin.'admincategory.php"><i class="zmdi zmdi-bookmark-outline zmdi-hc-fw"></i>&nbsp;&nbsp; Nueva categoría</a></li>
                                <li><a href="'.$LinkRouteAdmin.'adminsection.php"><i class="zmdi zmdi-assignment-account zmdi-hc-fw"></i>&nbsp;&nbsp; Nueva sección</a></li>
                            </ul>
                        </li>
                        <li>
                            <div class="dropdown-menu-button"><i class="zmdi zmdi-account-add zmdi-hc-fw"></i>&nbsp;&nbsp; Registro de usuarios <i class="zmdi zmdi-chevron-down pull-right zmdi-hc-fw"></i></div>
                            <ul class="list-unstyled">
                                <li><a href="'.$LinkRouteAdmin.'adminuser.php"><i class="zmdi zmdi-face zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo administrador</a></li>
                                <li><a href="'.$LinkRouteAdmin.'adminteacher.php"><i class="zmdi zmdi-male-alt zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo docente</a></li>
                                <li><a href="'.$LinkRouteAdmin.'adminstudent.php"><i class="zmdi zmdi-accounts zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo estudiante</a></li>
                                <li><a href="'.$LinkRouteAdmin.'adminpersonal.php"><i class="zmdi zmdi-male-female zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo personal administrativo</a></li>
                            </ul>
                        </li>
                        <li>
                            <div class="dropdown-menu-button"><i class="zmdi zmdi-assignment-o zmdi-hc-fw"></i>&nbsp;&nbsp; Libros y catálogo <i class="zmdi zmdi-chevron-down pull-right zmdi-hc-fw"></i></div>
                            <ul class="list-unstyled">
                                <li><a class="btn-addBook" href="#" data-process="'.$LinksRoute.'process/checkDataAdmin.php" data-href="'.$LinkRouteAdmin.'admininventory.php"><i class="zmdi zmdi-book zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo libro</a></li>
                                <li><a href="'.$LinksRoute.'catalog.php"><i class="zmdi zmdi-bookmark-outline zmdi-hc-fw"></i>&nbsp;&nbsp; Catálogo</a></li>
                            </ul>
                        </li>
                        ';
                    }
                ?>
            </ul>
        </div>
    </div>
</div>