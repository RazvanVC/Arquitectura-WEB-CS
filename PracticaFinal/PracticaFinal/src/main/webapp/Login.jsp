<%-- 
    Document   : Login
    Created on : 13 ene 2022, 17:54:14
    Author     : razvanvc
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
        <title>Login</title>
    </head>
    <body>
        <img src="/resources/images/logo.png" alt="Logo" width="100" height="100">
        <section>
            <form action="">
                <fieldset>
                    <legend>Login</legend>
                    <label for="username">Email:</label>
                    <input type="email" name="username" id="username" required="required" />
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" required="required" />
                    <input type="submit" value="Login" name="login"/>
                </fieldset>
            </form>
            <a href="">/Register">Register</a>
        </section>

        <%
            c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            //c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample?,?app?,?app");
            s = c.createStatement();
            if (request.getParameter("login") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (username.equals("admin@admin.com") && password.equals("admin")) {
                    response.sendRedirect("/PracticaFinal/v9.html");
                } else {
                    rs = s.executeQuery("SELECT * FROM APP.USUARIOS WHERE USUARIOS.CORREO='" + username + "' FETCH FIRST 1 ROWS ONLY");
                    if (rs.next()) {
                        String BDPassword = rs.getString("CONTRASEÑA");
                        if (BDPassword.equals(password)) {
                            session.setAttribute("DNI", rs.getString("DNI"));
                            session.setAttribute("Nombre", rs.getString("NOMBRE"));
                            session.setAttribute("Numero_Viajes", rs.getInt("NUMERO_VIAJES"));
                            session.setAttribute("ID_Session", session.getId());
                            response.sendRedirect("/MainMenu.jsp");
                        }
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('User or password incorrect');");
                        out.println("location='Login.jsp';");
                        out.println("</script>");
                    }
                }
            }
        %>
    </body>
</html>
