<%-- 
    Document   : OrigenDestino
    Created on : 13 ene 2022, 18:46:23
    Author     : javi481
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
        <section class="section">
            <%@ page import="java.sql.*" %>
            <% 
                //metemos las variables necesarias

            %>

            <label class="label">Seleccione Latitud</label>
            <select class="select" name="latitud">

            </select>

            <label class="label">Seleccione Longitud</label>
            <select class="select" name="longitud">

            </select>

            <label class="label">Seleccione Nombre</label>
            <select class="select" name="nombre_v10">

            </select>

            
            //Hacer el combobox de tasa
            <form action="CalculoFinal.jsp" method="post">
                <br/>
                <label class="label">Seleccione un circuito</label>
                <select class="select" name="circuito">
                    <% while (rs.next()) { %>
                    <% for (int i = 1; i <= rsmd.getColumnCount(); i++) { %>
                    <%-- Recuperamos los valores de las columnas que
                    corresponden a cada uno de los registros de la
                    tabla. Hay que recoger correctamente el tipo de
                    dato que contiene la columna --%>
                    
                        <option><%= rs.getString(i)%></option>
                        <%}
                    }%>
                </select>
                <br>
                <%
                s = c.createStatement();
                rs = s.executeQuery("SELECT COCHE.NOMBRE FROM APP.COCHE");
                rsmd = rs.getMetaData();
                %>
                <br/>
                <label class="label">Seleccione un coche</label>
                <select class="select" name="coche">
                    <% while (rs.next()) { %>
                    <% for (int i = 1; i <= rsmd.getColumnCount(); i++) { %>
                    <%-- Recuperamos los valores de las columnas que
                    corresponden a cada uno de los registros de la
                    tabla. Hay que recoger correctamente el tipo de
                    dato que contiene la columna --%>
                    
                        <option><%= rs.getString(i)%></option>
                        <%}
                    }%>
                </select>
                <br/>
                <br/>
                <input class="myButton" type="submit" value="Calcular Ganancia">
            </form>

            

            <br/>
            <br/>
            <input class="myButton" type="submit" value="Confirmar">
            <button class="myButton" onclick="location.href='./v1'">Volver al menú principal</button>



        </section>
    </body>

</html>