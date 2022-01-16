<%-- 
    Document   : Ver
    Created on : 14-ene-2022, 20:31:52
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Billetes</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>    
    <body class="body2">
        <header class="encabezado">
            <h1> <img src="./img/logo.png"  alt="Logo" width="100" height="100"> </h1>
            <h2> Vista de Billetes Comprados </h2>
        </header>

        <section>
        
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
                rs = s.executeQuery("SELECT * FROM APP.BILLETES WHERE BILLETES.DNI_COMPRADOR = '" + request.getSession().getAttribute("DNI").toString()+"'");

                rsmd = rs.getMetaData();
            %>
           
            <table class="table2">
                <tr class="tr2">
                    <% for (int i = 1; i <= rsmd.getColumnCount(); i++) {%>
                    <%-- Obtenemos los nombres de las columnas y los colocamos
                    como cabecera de la tabla --%>
                    <th class="th2"><%= rsmd.getColumnLabel(i)%></th>
                        <% } %>
                </tr>
                <% while (rs.next()) { %>
                <tr class="tr2">
                    <% for (int i = 1; i <= rsmd.getColumnCount(); i++) { %>
                        <%-- Recuperamos los valores de las columnas que
                        corresponden a cada uno de los registros de la
                        tabla. Hay que recoger correctamente el tipo de
                        dato que contiene la columna --%>
                        <% if (i == 5) {%>
                        <td class="td2"><%= rs.getDate(i)%></td>
                        <% } else if (i==9) {%>
                        <td class="td2"><%= rs.getBigDecimal(i)%></td>
                        <% } else if (i==10){%>
                        <td class="td2"><%= rs.getInt(i)%></td>
                        <% } else {%>
                        <td class="td2"><%= rs.getString(i)%></td>
                        <% }
                    } %>
                </tr>
                <% }%>
            </table>
            <br/>
        </section>
        <br/>
        <button class="myButton3" onclick="location.href = './UserMainMenu.jsp'">Volver</button>
    </body>   
</html>

