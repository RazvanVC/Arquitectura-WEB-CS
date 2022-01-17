<%-- 
    Document   : DetalleVuelos
    Created on : 15-ene-2022, 14:27:46
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css">
        <title>Detalle Vuelos</title>
    </head>
    <body>
         <%
                // Inicialización de las variables necesarias para la
                // conexión a la base de datos y realización de consultas
                c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
                //c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample?,?app?,?app");
                s = c.createStatement();
                //Cambiar query
                rs = s.executeQuery("SELECT * FROM APP.VUELO WHERE VUELO.ID_VUELO = '" + request.getSession().getAttribute("Id_vuelo").toString()+"' FETCH FIRST 1 ROWS ONLY");
                rs.next();
                double Media_Ocupacion= ((<%= rs.getInt("NUM_PASAJEROS")%>)/(<%= rs.getInt("NUM_ASIENTOS")%>));
            %>
        <header class="encabezado">
         <h1> <img src="./img/logo.png" alt="Logo" width="100" height="100"> </h1>
         <h2> DETALLE DE LOS VUELOS</h2>
        </header>
        <section class="seccion">
                <h2> Datos sobre el vuelo:</h2>
                <table>
                    <tr>
                    <td><label for="Origen">Origen:</label></td>
                    <td class="td2"><%= rs.getString("ORIGEN")%></td>
                    </tr>
                    <tr>
                    <td><label for="Destino">Destino:</label></td>
                    <td class="td2"><%= rs.getString("DESTINO")%></td>
                    </tr>
                    <tr>
                    <td><label for="Fecha">Fecha:</label></td>
                    <td class="td2"><%= rs.getDate("FECHA")%></td>
                    </tr>
                    <tr>
                    <td><label for="Num_viajeros">Numero Plazas:</label></td>  
                    <td class="td2"><%= rs.getInt("NUM_ASIENTOS")%></td>
                    </tr>
                    <tr>
                    <td><label for="Num_">Numero Viajeros:</label></td>  
                    <td class="td2"><%= rs.getInt("NUM_PASAJEROS")%></td>
                    </tr>
                    <tr>
                    <td><label for="Num_">Precio Billete:</label></td>  
                    <td class="td2"><%= rs.getDouble("PRECIO_BILLETE")%></td>
                    </tr>
                    <tr>
                    <td><label for="GANANCIAS">Ganancias:</label></td>
                    <td class="td2"><%= rs.getDouble("GANANCIAS")%>€</td> 
                    </tr>
                    <tr>
                    <td><label for="TASAS_TOTALES_AEROPUERTOS">Tasas Totales Aeropuestos:</label></td>  
                    <td class="td2"><%= rs.getDouble("TASAS_TOTALES_AEROPUERTOS")%></td>
                    </tr>
                    <tr>
                    <td><label for="IMPUESTOS_TOTALES">Impuestos Totales:</label></td>
                    <td class="td2"><%= rs.getDouble("IMPUESTOS_TOTALES")%></td>  
                    </tr>
                    <tr>
                    <td><label for="Media_Ocupacion">Media Ocupacion:</label></td>
                    <td class="td2"><%=Media_Ocupacion%></td>  
                    </tr>
                    <tr><td>Lista Pasajeros</td></tr>
                    <% rs = s.executeQuery("SELECT BILLETES.NOMBRE,BILLETES.APELLIDOS FROM APP.BILLETES WHERE BILLETES.ID_AVION ='"++ request.getSession().getAttribute("Id_vuelo").toString()+"'")%>
                        <% while (rs.next()) { %>
                                <tr>
                                    <td>
                                    <%= rs.getString("NOMBRE")%>
                                    </td>
                                    <td>
                                    <%= rs.getString("APELLIDOS")%>
                                    </td>
                                </tr>
                        <% }
                     %>
                </table>
            <button class="myButton2" onclick="location.href = './AdminMainMenu.html'">Volver a la página de Administrador</button>
        </section>

    </body>
</html>
