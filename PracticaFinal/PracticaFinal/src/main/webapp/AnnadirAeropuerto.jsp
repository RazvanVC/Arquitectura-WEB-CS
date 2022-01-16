<%-- 
    Document   : OrigenDestino
    Created on : 13 ene 2022, 18:46:23
    Author     : javi481
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
        <title>Añadir Aeropuerto</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>

    <body>

        <header class="encabezado">
        
            <h1> <img src="./img/logo.png" alt="Logo" width="300" height="300"> </h1>
            <h2>Añadir Aeropuerto</h2>
        </header>

        <section class="seccion">
            <form action="">
                <table>
                    <tr>
                        <td>
                            <input type="radio" name="tipo" value="origen" checked>
                            <label for="tipo">ORIGEN</label>
                        </td>
                        <td>
                            <input type="radio" name="tipo" value="destino">
                            <label for="tipo">DESTINO</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label2">Escribe Latitud    </label>
                            <input type="text" id="Latitud" name="Latitud" value="Latitud"><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label2">Escribe Longitud    </label>
                            <input type="text" id="Longitud" name="Longitud" value="Longitud"> <br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label2">Escribe el Nombre    </label>
                            <input type="text" id="Nombre" name="Nombre" value="Nombre"> <br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label2">Seleccione una tasa    </label>
                            <select class="select2" name="tasa">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <input type="submit" id="Confirmar" name="Confirmar" value="  Confirmar  "><br>
            </form>

            <br/>
            <br/>

            <br/>
            <button class="myButton" >Volver al menú principal</button>
            <br/>
            <br/>

        </section>

        <%
            c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            s = c.createStatement();

            if (request.getParameter("Confirmar") != null) {
                String tipo = request.getParameter("tipo");
                String Nombre = request.getParameter("Nombre"); 
                Double Latitud = Double.valueOf(request.getParameter("Latitud"));
                Double Longitud = Double.valueOf(request.getParameter("Longitud"));
                int tasa = Integer.valueOf(request.getParameter("tasa"));
                boolean registro = true;
                //para ver si existe la tabla
                s.executeQuery("SELECT ORIGEN.NOMBRE FROM APP.ORIGEN");
                rs = s.getResultSet();
                rsmd = rs.getMetaData();

                while (rs.next()) {
                    if(rs.getString("NOMBRE").equals(Nombre)){
                        out.println("<script type=\"text/javascript\">");
                            out.println("alert('Name already register');");
                            out.println("location='AnnadirAeropuerto.jsp';");
                            out.println("</script>");
                        registro=false;
                    }
                }
                s.executeQuery("SELECT DESTINO.NOMBRE FROM APP.DESTINO");
                rs = s.getResultSet();
                while (rs.next()) {
                    if(rs.getString("NOMBRE").equals(Nombre)){
                        out.println("<script type=\"text/javascript\">");
                            out.println("alert('Name already register');");
                            out.println("location='AnnadirAeropuerto.jsp';");
                            out.println("</script>");
                        registro=false;
                    }
                }

                if (registro) {
                    if(tipo.equals("origen")){
                        s.executeUpdate("INSERT INTO APP.ORIGEN (NOMBRE, LATITUD, LONGITUD,TASA) values ('"+Nombre+"',"+Latitud+","+Longitud+","+tasa+")");
                        response.sendRedirect("/AdminMainMenu.jsp");
                    } else if (tipo.equals("destino")){
                        s.executeUpdate("INSERT INTO APP.DESTINO (NOMBRE, LATITUD, LONGITUD,TASA) values ('"+Nombre+"',"+Latitud+","+Longitud+","+tasa+")");
                        response.sendRedirect("/AdminMainMenu.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                            out.println("alert('Name already register');");
                            out.println("location='AnnadirAeropuerto.jsp';");
                            out.println("</script>");
                    }
                }

                
            }


        %>
    </body>

</html>