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
    <body>
    <seccion>
        <h1>Bienvenido</h1>
        <p>
            Para registrarse hay que poner los datos que se requieren a continuacion
        </p>
        <!-- Formulario de registro de usuario, se requiere Nombre, Apellidos, DNI, Direccion, Email, Password, ConfirmarPassword  -->
        <form action="">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" required />
            <br/>
            <label for="apellidos">Apellidos:</label>
            <input type="text" name="apellidos" id="apellidos" required />
            <br/>
            <label for="dni">DNI:</label>
            <input type="text" name="dni" id="dni" required />
            <br/>
            <label for="direccion">Direccion:</label>
            <input type="text" name="direccion" id="direccion" required />
            <br/>
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" required />
            <br/>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required />
            <br/>
            <label for="confirmarPassword">Confirmar Password:</label>
            <input type="password" name="confirmarPassword" id="confirmarPassword" required />
            <br/>
            <input type="submit" value="Registrarse" name="login" />
        </form>
    </seccion>
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
</body>
</html>
