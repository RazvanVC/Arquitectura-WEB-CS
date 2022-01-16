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
        <title>Menu Usuario</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <!--Logo de la empresa-->
       <h1> <img src="/resources/images/logo.png" alt="Logo" width="100" height="100"> </h1>
        <!--Menu de navegacion con 3 botones-->
        <section class="seccion" id="1">
            <br/>
            <h2>Bienvenido <%= session.getAttribute("Nombre") %></h2>
            <br/>
            <button class="myButton" onclick="location.href='CompraBillete.jsp'">Comprar Billetes</button>
            <br/>
            <br/>
            <button class="myButton" onclick="location.href='ConsultaDatos.jsp'">Consulta mis Billetes</button>
            <br/>
            <br/>
            <button class="myButton" onclick="location.href='Login.jsp'">Salir</button>
            <br/>
            <br/>
        </section>
        
    </body>
</html>
