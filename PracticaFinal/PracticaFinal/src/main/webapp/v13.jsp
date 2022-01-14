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

            
            <form action=''>
            <table>
                <tr>
                    <td>
                        <input type="radio" id="Ruta" name="Ruta" value="Ruta">Ruta del vuelo <br>
                    </td>
                    <td>
                        <input type="radio" id="Vuelo" name="Vuelo" value="Vuelo">Destino del vuelo <br>
                    </td>
                </tr>
                <tr>
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
                    </td>
                    <td>
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
                </tr>

                <tr>
                    <td>
                        <input type="date" id="FechaOrigen" name="FechaOrigen" value="" required>Origen del vuelo <br>
                    </td>
                    <td>
                        <input type="date" id="FechaDestino" name="FechaDestino" value="" required>Destino del vuelo <br>
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

    <%  if (request.getParameter("Confirmar") != null) {
            String username = request.getParameter("username");   //ESTO HAY QUE BURRARLO KBRON
            String password = request.getParameter("password");

            if (username.equals("admin@admin.com") && password.equals("admin")) {
                response.sendRedirect("/PracticaFinal/v9.html");
            } else {
                rs = s.executeUpdate("SELECT USUARIOS.CONTRASEÑA FROM APP.USUARIOS WHERE USUARIOS.CORREO='" + username + "' FETCH FIRST 1 ROWS ONLY");
                if (rs.next()) {
                    String BDPassword = rs.getString("CONTRASEÑA");
                    if (BDPassword.equals(password)) {
                        response.sendRedirect("/V4.jsp");
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User or password incorrect');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                }
            }
        } //Hasta aqui se Burra KBRON

        Date origen = request.getParameter("FechaOrigen");
        Date destino =request.getParameter("FechaDestino");


    }
    </body>        
</html>