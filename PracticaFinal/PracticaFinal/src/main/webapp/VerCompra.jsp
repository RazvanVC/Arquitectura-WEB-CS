<%-- 
    Document   : VerCompra
    Created on : 14-ene-2022, 19:22:37
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css">
        <title>Ver Compra</title>
    </head>
    <body>
         <h1> <img src="/resources/images/logo.png" alt="Logo" width="100" height="100"> </h1>
        <section>
            <div>
                <h2>Billete</h2>
                <table>
                    <tr>
                        <td>Id:</td>
                        <td> Origen:</td>
                    </tr>
                    <tr>
                        <td>Id Vuelo:</td>
                        <td>Destino:</td>
                    </tr>
                    <tr>
                        <td>Fecha Salida:</td>
                    </tr>
                    <tr>
                        <td>Nombre y Apellidos:</td>
                    </tr>
                    <tr>
                        <td>Dni:</td>
                    </tr>
                    <tr>
                        <td>VISA:</td>
                        <td>Precio:</td>
                    </tr>
                </table>
            </div>
        </section>
        <button class="myButton" onclick="location.href = './MenuUsuario.jsp'">Continuar</button>
    </body>
</html>
