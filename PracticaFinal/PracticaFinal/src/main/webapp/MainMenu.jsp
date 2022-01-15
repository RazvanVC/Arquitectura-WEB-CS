<%-- 
    Document   : MainMenu
    Created on : 15 ene 2022, 11:31:22
    Author     : razvanvc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Menu</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <!--Logo de la empresa-->
        <div class="logo">
            <img src="/resources/images/logo.png" alt="Logo" width="100" height="100">
        </div>
        <!--Menu de navegacion con 3 botones-->
        <section class="seccion" id="1">
            <br/>
            <h2>Bienvenido {nombre} !</h2>
            <br/>
            <button class="myButton" onclick="location.href='ComprarBilletes.jsp'">Comprar Billetes</button>
            <br/>
            
            <br/>
            <button class="myButton" onclick="location.href='ConsultaDatos.jsp'">Consulta mis Billetes</button>
            <br/>
            
            <br/>
            <button class="myButton" onclick="location.href='CalcularGanancia.jsp'">Salir</button>
            <br/>
            
            <br/>
        </section>
        
    </body>
</html>
