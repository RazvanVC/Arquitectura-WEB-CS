<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="./css/style.css">
    <script src="main.js"></script>
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
                        <h1>Vuelo</h1>
                        <label class="label">Vuelo: </label>
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
                        rs = s.executeQuery("SELECT VUELO.ID_VUELO  ID FROM APP.VUELO");
                        rsmd = rs.getMetaData();
                        %>
                    </tr>

                    <tr>
                        <input type="date" id="Fecha" name="Fecha" value="" required>Fecha <br>
                    </tr>

                    <tr>
                        <input type="number" id="PrecioBillete" name="PrecioBillete" value="" required>Precio Billete <br>
                    </tr>

                    <tr>
                        <input type="submit" id="Confirmar" name="Confirmar" value="Confimar">Confirmar<br>
                    </tr>

                    <tr>
                        <button class="myButton" onclick="location.href='./v9'">Volver a la página de Administrador</button>
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
