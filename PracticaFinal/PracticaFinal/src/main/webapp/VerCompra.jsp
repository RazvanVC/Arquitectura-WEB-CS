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
        <header class="encabezado">
            <h1> <img src="/src/main/resources/META-INF/images/logo.png" alt="Logo" width="300" height="300"> </h1>
            <h2>Ver Compra Realizada</h2>
        </header>

        <section class="seccion2">
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
        <br/>
        <br/>
        <button class="myButton" onclick="location.href = './MenuUsuario.jsp'">Continuar</button>
    </body>
</html>
