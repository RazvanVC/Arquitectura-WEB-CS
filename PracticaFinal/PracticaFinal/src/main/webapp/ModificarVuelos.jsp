<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
        <title>Modificar Vuelos</title>
        <link rel="stylesheet" href="./css/style.css">
        <script src="main.js"></script>
    </head>

    <body>
        <header class="encabezado">
            <h1> <img src="./img/logo.png" alt="Logo" width="300" height="300"> </h1>
            <h2>MODIFICAR VUELO</h2>
        </header>

        <section class="seccion">
            <form action=''>
                <br/>
                <br/>
                <table>
                    <tr>
                        <label class="label2">Vuelo a modificar:</label>
                        <input type="text" id="Vuelo" name="Vuelo" value"" required>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <label class="label2">Fecha a modificar:</label>
                        <input type="date" id="Fecha" name="Fecha" value="" required> 
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <label class="label2">Precio del Billete:</label>
                        <input type="number" id="PrecioBillete" name="PrecioBillete" value="" required>
                    </tr>
                    <br/>
                    <br/>
                    <br/>
                    <tr>
                        <input type="submit" id="Confirmar" name="Confirmar" value="  Confimar  ">
                    </tr>
                    <br/>
                    <br/>
                    <br/>
                    <tr>
                        <button class="myButton2" onclick="location.href = './AdminMainMenu.html'">Volver a la página de Administrador</button>
                    </tr>
                </table>
            </form>
        </section>

        <%

            c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            s = c.createStatement();

            if (request.getParameter("Confirmar") != null) {
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

                if (registro) {
                    s.executeUpdate("UPDATE APP.VUELO SET FECHA=" + fecha + ",  PRECIO_BILLETE='" + precioBillete + "' ");
                    response.sendRedirect("/PracticaFinal/AcceptQuery.html");
                }
            }
        %>

    </body>
</html>
