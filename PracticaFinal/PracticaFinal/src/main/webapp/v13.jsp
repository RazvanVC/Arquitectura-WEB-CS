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

            
            <table>
                <tr>
                    <td>
                        <input type="radio" id="Ruta" name="Ruta" value="ruta">Ruta del vuelo <br>
                        <input type="radio" id="Destino" name="Destino" value="destino">Destino del vuelo <br>
                    </td>

                    <td>
                        <h1>Origen del Vuelo</h1>
                        <label class="label">Seleccione Origen del Vuelo a modificar: </label>
                        <select class="select" name="origen">
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
                        <%
                        s = c.createStatement();
                        rs = s.executeQuery("SELECT DESTINO.NOMBRE FROM APP.DESTINO");
                        rsmd = rs.getMetaData();
                        %>

                        <h2>Destino del Vuelo</h2>
                        <label class="label">Seleccione Destino del Vuelo a modificar: </label>
                        <select class="select" name="destino">
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
                    </td>

                    <td>
                        <input type="date" id="FechaOrigen" name="Fecha de Origen" value="Fecha Origen">Origen del vuelo <br>
                        <input type="date" id="FechaDestino" name="Fecha Destino" value="Fecha Destino">Destino del vuelo <br>
                    </td>

                    <td>
                        <input type="date" id="FechaInicio" name="Fecha del Inicio" value="Fecha Inicio">Inicio del vuelo <br>
                        <input type="date" id="FechaFinal" name="Fecha del Final" value="Fecha Final">Final del vuelo <br>
                    </td>

                    <td>
                        <input type="number" id="Temporalidad" name="Temporalidad" value="Temporalidad">Temporalidad <br>
                    </td>

                    <td>
                        <input type="radio" id="PrecioRecomendado" name="Precio Recomendado" value="Precio Recomendado">Precio recomendado <br>
                        <input type="radio" id="PrecioCustomizado" name="Precio Customizado" value="Precio Customizado">Precio customizado <br>
                    </td>

                    <td>
                        <input type="number" id="PrecioBillete" name="Precio del Billete" value="Precio Billete">Precio del billete<br>
                    </td>

                    <td>
                        <input type="submit" id="Confirmar" name="Confirmar" value="Confimar">Confirmar<br>
                    </td>

                    <td>
                        <button class="myButton" onclick="location.href='./v9'">Volver a la página de Administrador</button>
                    </td>

                </tr>
            </table>

            




</html>