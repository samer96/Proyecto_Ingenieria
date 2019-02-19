$("#div-btnRegistroa").click(function(){
  
 if($("#txt-pnombre").val()&&$("#txt-papellido").val()&&$("#txt-snombre").
  val()&&$("#txt-sapellido").val()&&$("#txt-correo").val())
 
   {
        var parametros = "txt-correo="+$("#txt-correo").val()+"&"+"txt-papellido="+$("#txt-papellido").val()+
                   "&txt-pnombre="+$("#txt-pnombre").val()+
                   "&txt-snombre="+$("#txt-snombre").val()+
                   "&txt-sapellido="+$("#txt-sapellido").val();
                   
                   alert(parametros);
    $.ajax({
        url:"ajax/gestion-usuario.php?accion=crear-empleado",
        data: parametros,
        method:"POST",
        success:function(respuesta){
          alert(respuesta + "Datos Personales resgistrados");
        },
        error:function(e){      
          alert("Hay un problema");
        }
  
});
}
else{$("#div-error-2").html("Verifique los datos")

}

});

//DIRECCION//
$("#div-btnRegistro2").click(function(){
  if($("#txt-ciudad").val()&&$("#txt-colonia").val()&&$("#txt-calle").
  val()&&$("#txt-bloque").val()&&$("#txt-numero_casa").val())
    {
         var parametros = "txt-ciudad="+$("#txt-ciudad").val()+"&"+"txt-colonia="+$("#txt-colonia").val()+
                   "&txt-calle="+$("#txt-calee").val()+"&"+"txt-bloque="+$("#txt-bloque").val()+
                   "&txt-numero_casa="+$("#txt-numero_casa").val();
          alert(parametros);
     $.ajax({
         url:"ajax/gestion-usuario.php?accion=crear-direccion",
         data: parametros,
         method:"POST",
         success:function(respuesta){
           alert(respuesta + "Direccion Registrada");
         },
         error:function(e){      
           alert("Hay un problema");
         }
   
 });
 }
 else{$("#div-error-2").html("Verifique los datos")
 
 }
 
 });