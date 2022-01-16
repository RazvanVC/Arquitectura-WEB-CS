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

            <header class="encabezado">
                <h1> <img src="/src/main/resources/META-INF/images/logo.png" alt="Logo" width="300" height="300"> </h1>
                
                <h2>Origen del Vuelo</h2>
            </header>

            <form action="CalculoFinal.jsp" method="post">

                <tr>
                    <td>
                        <input type="radio" name="tipo" value="ida">
                        <label for="tipo">Origen</label>
                    </td>
                    <td>
                        <input type="radio" name="tipo" value="ida+vuelta">
                        <label for="tipo">Destino</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text">Escribe Latitud</label>
                        <input type="text" id="Latitud" name="Latitud" value="Latitud">Latitud <br>
                    </td>
                </tr>
                <tr>
                    <td>
                    <label class="label">Escribe Longitud</label>
                    <input type="text" id="Longitud" name="Longitud" value="Longitud">Longitud <br>
                    </td>
                </tr>
                <tr>
                    <td>
                    <label class="label">Escribe el Nombre</label>
                    <input type="text" id="Nombre" name="Nombre" value="Nombre">Nombre <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        Aqui hay que hacer bien las tasas maquinas
                        <label class="label">Seleccione una tasa</label>
                        <select class="select" name="tasa">
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
                </tr>
                <input type="submit" id="Confirmar" name="Confirmar" value="Confimar">Confirmar<br>
            </form>

            <br/>
            <br/>
            
            <br/>
            <button class="myButton" onclick="location.href='./Login.jsp'">Volver al menú principal</button>
            <br/>
            <br/>
        </section>
        <%

        c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
        s = c.createStatement();

        if (request.getParameter("Confirmar") != null) {
            String Origen = request.getParameter("Origen");
            String Destino = request.getParameter("Destino");
            String Nombre = request.getParameter("Nombre"); 
            Double precioBillete = Double.valueOf(request.getParameter("PrecioBillete"));

            //para ver si existe la tabla
            s.executeQuery("SELECT VUELO.ID_VUELO FROM APP.VUELO");
            rs = s.getResultSet();
            rsmd = rs.getMetaData();

            while (rs.next()) {
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    if (rs.getString(i).equals(vuelo)) {
                        registro = false;
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Fly already register');");
                        out.println("location='ModificarVuelos.jsp';");
                        out.println("</script>");
                    }
                }
            }

            if (registro) {
                s.executeUpdate("UPDATE APP.VUELO SET FECHA=" + fecha + ",  PRECIO_BILLETE='" + precioBillete + "' ");
                response.sendRedirect("/PracticaFinal/AcceptQuery.html");
            }
        }
    %>
    }
    </body>

</html>