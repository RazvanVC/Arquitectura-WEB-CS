<%-- 
    Document   : RegisterUser
    Created on : 15 ene 2022, 12:44:11
    Author     : razvanvc
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
    Boolean registro = true;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body class="body2">
        <section class="seccion">
            <header class="encabezado">
                <h1> <img src="./img/logo.png" alt="Logo" width="300" height="300"> </h1>
                <h2>Bienvenido</h2>
            </header>
            <br/>
            <br/>
            <br/>

            <p>
                Para registrarse hay que poner los datos que se requieren a continuacion:
            </p>
            <br/>

            <!-- Formulario de registro de usuario, se requiere Nombre, Apellidos, DNI, Direccion, Email, Password, ConfirmarPassword  -->
            <section class="seccion3">
                <form action="">
                    <table>
                        <tr>
                            <td>Nombre:</td>
                            <td><input type="text" name="nombre" id="nombre"/></td>
                        </tr>
                        <tr>
                            <td>Apellidos:</td>
                            <td><input type="text" name="apellidos" id="apellidos"/></td>
                        </tr>
                        <tr>
                            <td>DNI:</td>
                            <td><input type="text" name="dni" id="dni"/></td>
                        </tr>
                        <tr>
                            <td>Direccion:</td>
                            <td><input type="text" name="direccion" id="direccion"/></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="email" name="email" id="email"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="password" id="password"/></td>
                        </tr>
                        <tr>
                            <td>Confirmar Password:</td>
                            <td><input type="password" name="confirmarPassword" id="confirmarPassword"/></td>
                        </tr>
                    </table>
                    <input type="submit" value="Registrarse" name="login"/>
                </form>
            </section>
            <%
                c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
                //c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample?,?app?,?app");
                s = c.createStatement();
                if (request.getParameter("login") != null) {
                    String nombre = request.getParameter("nombre");
                    String apellidos = request.getParameter("apellidos");
                    String dni = request.getParameter("dni");
                    String direccion = request.getParameter("direccion");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String confirmarPassword = request.getParameter("confirmarPassword");
                    s.executeQuery("SELECT USUARIOS.DNI FROM APP.USUARIOS");
                    rs = s.getResultSet();
                    rsmd = rs.getMetaData();
                    while (rs.next()) {
                        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                            if (rs.getString(i).equals(dni)) {
                                registro = false;
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('User already register');");
                                out.println("location='RegisterUser.jsp';");
                                out.println("</script>");

                            }
                        }
                    }
                    if (registro) {
                        if (password.equals(confirmarPassword)) {
                            String query = "INSERT INTO APP.USUARIOS (NOMBRE, APELLIDOS, DNI, DIRECCION, CORREO, CONTRASEÑA, NUMERO_VIAJES) VALUES ('" + nombre + "', '" + apellidos + "', '" + dni + "', '" + direccion + "', '" + email + "', '" + password + "', 0)";
                            s.executeUpdate(query);
                            session.setAttribute("DNI", dni);
                            session.setAttribute("Nombre", nombre);
                            session.setAttribute("Numero_Viajes", 0);
                            session.setAttribute("ID_Session", session.getId());
                            response.sendRedirect("/PracticaFinal/UserMainMenu.jsp");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Password does not mach');");
                            out.println("location='RegisterUser.jsp';");
                            out.println("</script>");
                        }
                    }
                }
            %>
        </section>
    </body>
</html>
