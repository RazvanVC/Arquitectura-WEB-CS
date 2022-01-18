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

        <header class="encabezado">
                <h1> <img src="./img/logo.png" alt="Logo" width="300" height="300"> </h1>

                <h2>COMPRA DE BILLETES</h2>
        </header>

        <section class="seccion">    
            <!-- Tabla que continene 7 filas. La primera son dos comboboxes la segunda son dos radio buttons, la tercera dos capos de fecha, y la quinta un boton-->
            <form action="">
                <table class="table">
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
                            <select class="select" hidden id="formVuelta" name="MesVUELTA">
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
                </table>
                <input type="submit" value="Consultar" class="myButton" name="consultar">
            </form>
            <% 
            if (request.getParameter("consultar") != null){
                session.setAttribute("origen", request.getParameter("origen"));
                session.setAttribute("destino", request.getParameter("destino"));
                session.setAttribute("tipo", request.getParameter("tipo"));
                session.setAttribute("MesIDA", request.getParameter("MesIDA"));
                session.setAttribute("MesVUELTA", request.getParameter("MesVUELTA"));
                response.sendRedirect("/PracticaFinal/ConfirmarBillete.jsp");
            }
           
            %>

            <br/>
        <button class="myButton3" onclick="location.href = './UserMainMenu.jsp'">Volver</button>
        <br/>
        </section>
        

    </body>
</html>
