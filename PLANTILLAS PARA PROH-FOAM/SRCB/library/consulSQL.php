<?php
error_reporting(E_PARSE);
class ejecutarSQL {
    public static function conectar(){
        if(!$con=  mysql_connect(SERVER,USER,PASS)){
            die("Error en el servidor, verifique sus datos");
        }
        if (!mysql_select_db(BD)) {
            die("Error al conectar con la base de datos, verifique el nombre de la base de datos");
        }
        mysql_set_charset('utf8',$con);
        return $con;  
    }
    public static function consultar($query) {
        mysql_query("SET AUTOCOMMIT=0;", ejecutarSQL::conectar());
        mysql_query("BEGIN;", ejecutarSQL::conectar());
        if (!$consul = mysql_query($query, ejecutarSQL::conectar())) {
            die(mysql_error().' Error en la consulta SQL ejecutada ');
            mysql_query("ROLLBACK;", ejecutarSQL::conectar());
        }else{
            mysql_query("COMMIT;", ejecutarSQL::conectar());
        }
        return $consul;
    }  
}
class consultasSQL{
    public static function limpiarCadena($valor) {
        $valor = str_ireplace("<script>", "", $valor);
        $valor = str_ireplace("</script>", "", $valor);
        $valor = str_ireplace("--", "", $valor);
        $valor = str_ireplace("^", "", $valor);
        $valor = str_ireplace("[", "", $valor);
        $valor = str_ireplace("]", "", $valor);
        $valor = str_ireplace("\\", "", $valor);
        $valor = str_ireplace("=", "", $valor);
        return $valor;
    }
    public static function CleanStringText($val) {
        $data = addslashes($val);
        $datos = consultasSQL::limpiarCadena($data);
        return $datos;
    }
    public static function InsertSQL($tabla, $campos, $valores) {
        if (!$consul = ejecutarSQL::consultar("INSERT INTO $tabla ($campos) VALUES($valores)")) {
            die("Ha ocurrido un error al guardar los datos");
        }
        return $consul;
    }
    public static function DeleteSQL($tabla, $condicion) {
        if (!$consul = ejecutarSQL::consultar("DELETE FROM $tabla WHERE $condicion")) {
            die("Ha ocurrido un error al eliminar los datos");
        }
        return $consul;
    }
    public static function UpdateSQL($tabla, $campos, $condicion) {
        if (!$consul = ejecutarSQL::consultar("UPDATE $tabla SET $campos WHERE $condicion")) {
            die("Ha ocurrido un error al actualizar los datos");
        }
        return $consul;
    }
}