<%-- 
    Document   : CalcularGanancia
    Created on : 16 dic 2021, 12:21:33
    Author     : razvanvc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <section class="seccion">
            <h1>Calcular Ganancia</h1>
            <form action="CalculoFinal.jsp" method="post">
                <label>Seleccione un circuito</label>
                <select name="circuito">
                    <!-- TODO: JSP CODE HERE-->
                </select>
                <label>Seleccione un coche</label>
                <select name="coche">
                    <!-- JSP CODE HERE-->
                </select>
                <input type="submit" value="Calcular Ganancia">
            </form>
        </section>
    </body>
</html>
