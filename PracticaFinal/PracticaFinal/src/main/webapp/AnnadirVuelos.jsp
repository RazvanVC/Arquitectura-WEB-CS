<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Añadir Vuelos</title>
    <link rel="stylesheet" href="./css/style.css">
    <script src="main.js"></script>
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

            
            <form action=''>
            <table>
                <tr>
                    <td>
                        <input type="radio" id="Ruta" name="Ruta" value="Ruta">Ruta <br>
                    </td>
                    <td>
                        <input type="radio" id="Vuelo" name="Vuelo" value="Vuelo">Vuelo <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h1>Origen del Vuelo</h1>
                        <label class="label">Seleccione Origen del Lugar: </label>
                        <select class="select" name="LugarOrigen">
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
                    </td>
                    <td>
                        <h2>Destino del Vuelo</h2>
                        <label class="label">Seleccione Destino del Destino: </label>
                        <select class="select" name="LugarDestino">
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

                <tr>
                    <td>
                        <input type="date" id="FechaInicio" name="FechaInicio" value="" required>Inicio del vuelo <br>
                    </td>
                    <td>
                        <input type="date" id="FechaFinal" name="FechaFinal" value="" >Final del vuelo <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="number" id="Temporalidad" name="Temporalidad" value="">Temporalidad <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" id="PrecioRecomendado" name="PrecioRecomendado" value="Precio Recomendado">Precio recomendado <br>
                    </td>
                    <td>
                        <input type="radio" id="PrecioCustomizado" name="PrecioCustomizado" value="Precio Customizado">Precio customizado <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="number" id="PrecioBillete" name="PrecioBillete" value="">Precio del billete<br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" id="Confirmar" name="Confirmar" value="Confimar">Confirmar<br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="myButton" onclick="location.href='./v9'">Volver a la página de Administrador</button>
                    </td>
                </tr>
            </table>
            </form>
        </section> 

    <%
        c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
        s = c.createStatement();

        -------rs = s.executeUpdate("INSERT INTO APP.ORIGEN.NOMBRE VALUES(origen);");
        -------rs = s.executeUpdate("INSERT INTO APP.DESTINO.NOMBRE VALUES(destino)");

        if (request.getParameter("Confirmar") != null) {
            
            String origen = request.getParameter("LugarOrigen");
            String destino = request.getParameter("LugarDestino");
            Date inicio = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaInicio"));
            Date final = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaFinal"));
            Integer.valueOf("Temporalidad");

            
            rs = s.executeUpdate("INSERT INTO APP.VUELO SET FECHAFECHA_INICIO VALUES (inicio) ");
            
            


            String vuelo = request.getParameter("Vuelo");
            String fecha = request.getParameter("Fecha");
            System.out.println(fecha);
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

        }

        s.executeUpdate("UPDATE APP.VUELO SET FECHA=" + fecha + ",  PRECIO_BILLETE='" + precioBillete + "' ");
        response.sendRedirect("/PracticaFinal/AcceptQuery.html");

        //BUCLEAMOS EL FOR PARA LA FECHA FINAL, PERO ESTA NO SE ALMACENA EN LA BASE DE DATOS
        rs = s.executeUpdate("INSERT INTO APP.VUELO.FECHA_INICIO VALUES (inicio) ");
        else
        while(inicio<Final)
        rs = s.executeUpdate("INSERT INTO APP.VUELO.FECHA_INICIO VALUES (inicio) ");
        rs = s.executeUpdate("INSERT INTO APP.VUELO.FECHA_FINAL VALUES (final) ");
        inicio= add(inicio+temporalidad)
        
        
    %>
    }
    </body>        
</html>