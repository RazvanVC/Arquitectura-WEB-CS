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
    </head>
    <body>
        <section class="seccion">
            <h1> <img src="/resources/images/logo.png" alt="Logo" width="100" height="100"> </h1>
            <h1>Compra Billete</h1>
            <!-- Tabla que continene 7 filas. La primera son dos comboboxes la segunda son dos radio buttons, la tercera dos capos de fecha, y la quinta un boton-->
            <form action="">
                <table>
                    <tr>
                        <td>
                            <select class="select">
                                <option value="0">Seleccione una opción</option>
                                <option value="1">Coche</option>
                                <option value="2">Circuito</option>
                            </select>
                        </td>
                        <td>
                            <select class="select">
                                <option value="0">Seleccione una opción</option>
                                <option value="1">Coche</option>
                                <option value="2">Circuito</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="tipo" value="ida">
                            <label for="tipo">IDA</label>
                        </td>
                        <td>
                            <input type="radio" name="tipo" value="ida+vuelta">
                            <label for="tipo">IDA+VUELTA</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select class="select">
                                <option value="0">Seleccione una opción</option>
                                <option value="1">Coche</option>
                                <option value="2">Circuito</option>
                            </select>
                        </td>
                        <td>
                            <select class="select">
                                <option value="0">Seleccione una opción</option>
                                <option value="1">Coche</option>
                                <option value="2">Circuito</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Consultar" class="myButton">
                        </td>
                    </tr>
                </table>
            </form>
        </section>
        <section class="seccion">
            <form>
                <table>
                    <tr>
                        <td>
                            <label for="fecha">Fecha de salida</label>
                            <input type="date" name="fecha" id="fecha">
                        </td>
                        <td>
                            <label for="fecha">Fecha de vuelta</label>
                            <input type="date" name="fecha" id="fecha">
                        </td>
                    </tr>
                    <tr>
                        <!-- Numero pasajeros -->
                        <td>
                            <label for="numeroPasajeros">Numero de pasajeros</label>
                            <input type="number" name="numeroPasajeros" id="numeroPasajeros">
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Comprar" class="myButton">
                        </td>
                    </tr>
                </table>
            </form>
        </section>

        
    </body>
</html>
