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
    <title>Añadir Aeropuerto</title>
    <link rel="stylesheet" href="./css/style.css">
    </head>

    <body>
        <section class="section">
        <h1> <img src="/resources/images/logo.png" alt="Logo" width="100" height="100"> </h1>
            <%@ page import="java.sql.*" %>
            <%!
                // Declaraciones de las variables utilizadas para la
                // conexión a la base de datos y para la recuperación de
                // datos de las tablas

                Connection c;
                Statement s;
                ResultSet rs;
                ResultSetMetaData rsmd;
            %>
            <%
                // Inicialización de las variables necesarias para la
                // conexión a la base de datos y realización de consultas

                c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
                //c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample?,?app?,?app");
                s = c.createStatement();
                
                rs = s.executeQuery("SELECT ORIGEN.NOMBRE FROM APP.ORIGEN");
                rsmd = rs.getMetaData();
            %>

            <h1>Origen del Vuelo</h1>
            <label

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