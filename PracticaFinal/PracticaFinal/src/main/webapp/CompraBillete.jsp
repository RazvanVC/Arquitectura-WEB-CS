<%-- 
    Document   : CompraBillete
    Created on : 15-ene-2022, 14:42:59
    Author     : PC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    // Declaraciones de las variables utilizadas para la
    // conexión a la base de datos y para la recuperación de
    // datos de las tablas
    Connection c;
    Statement s;
    ResultSet rs;
    ResultSetMetaData rsmd;
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra Billete</title>
        <link rel="stylesheet" href="./css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="./js/CompraBillete.js"></script>
    </head>
    <body>
        <% 
        c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app"); 
        %>
        <section class="seccion">
            <h1> <img src="/resources/images/logo.png" alt="Logo" width="100" height="100"> </h1>
            <h1>Compra Billete</h1>
            <!-- Tabla que continene 7 filas. La primera son dos comboboxes la segunda son dos radio buttons, la tercera dos capos de fecha, y la quinta un boton-->
            <form action="ConfirmarBillete.jsp" method="POST">
                <table>
                    <tr>
                        <td>
                            <%
                            s = c.createStatement();
                            rs = s.executeQuery("SELECT ORIGEN.NOMBRE FROM APP.ORIGEN");
                            rsmd = rs.getMetaData();
                            %>
                            <select class="select" id="origen" name="origen" >
                                <%  
                                while (rs.next()) {
                                %>
                                <%-- Recuperamos los valores de las columnas que
                                corresponden a cada uno de los registros de la
                                tabla. Hay que recoger correctamente el tipo de
                                dato que contiene la columna --%>
                                <option id="<%= rs.getString("NOMBRE") %>"><%= rs.getString("NOMBRE")%></option>
                                <%
                                }
                                %>
                            </select>
                        </td>
                        <td>
                            <%
                            s = c.createStatement();
                            rs = s.executeQuery("SELECT DESTINO.NOMBRE FROM APP.DESTINO");
                            rsmd = rs.getMetaData();
                            %>
                            <select class="select" name="destino">
                                <%  
                                while (rs.next()) {
                                %>
                                <%-- Recuperamos los valores de las columnas que
                                corresponden a cada uno de los registros de la
                                tabla. Hay que recoger correctamente el tipo de
                                dato que contiene la columna --%>
                                <option id="<%= rs.getString("NOMBRE") %>"><%= rs.getString("NOMBRE")%></option>
                                <%
                                }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="tipo" value="ida" checked onclick="showFields()">
                            <label for="tipo">IDA</label>
                        </td>
                        <td>
                            <input type="radio" name="tipo" value="ida+vuelta" onclick="showFields()">
                            <label for="tipo">IDA+VUELTA</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select class="select" name="MesIDA">
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                                <option value="4">Abril</option>
                                <option value="5">Mayo</option>
                                <option value="6">Junio</option>
                                <option value="7">Julio</option>
                                <option value="8">Agosto</option>
                                <option value="9">Septiembre</option>
                                <option value="10">Octubre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                            </select>
                        </td>
                        <td>
                            <select class="select" hidden id="formVuelta" name="MesVuelta">
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                                <option value="4">Abril</option>
                                <option value="5">Mayo</option>
                                <option value="6">Junio</option>
                                <option value="7">Julio</option>
                                <option value="8">Agosto</option>
                                <option value="9">Septiembre</option>
                                <option value="10">Octubre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Consultar" class="myButton" name="consultar">
                        </td>
                    </tr>
                </table>
            </form>
        </section>
    </body>
</html>
