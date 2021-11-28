<%-- 
    Document   : queryAlumnos
    Created on : 28 nov 2021, 12:49:54
    Author     : razvanvc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String val = request.getParameter("profesor");

            System.out.print(val);
            if (val != null) {
                session.setAttribute("Profesor", val);
            }
        %>
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
            rs = s.executeQuery("SELECT DISTINCT ALUMNO.NOMBRE, ALUMNO.APELLIDO, ALUMNO.SUELDO FROM ALUMNO, ASIGNATURA, ASIGNATURA_ALUMNO, PROFESOR, PROFESOR_ASIGNATURA WHERE ALUMNO.DNI=ASIGNATURA_ALUMNO.DNI_ALUMNO AND ASIGNATURA_ALUMNO.ASIGNATURA=ASIGNATURA.ASIGNATURA AND ASIGNATURA.ASIGNATURA=PROFESOR_ASIGNATURA.ASIGNATURA AND PROFESOR_ASIGNATURA.DNI_PROFESOR='" + session.getAttribute("Profesor")+"'");
            rsmd = rs.getMetaData();
        %>
        Hola, <%=session.getAttribute("Profesor")%>
        <table width="100%" border="1">
            <tr>
                <% for (int i = 1; i <= rsmd.getColumnCount(); i++) {%>
                <%-- Obtenemos los nombres de las columnas y los colocamos
                como cabecera de la tabla --%>
                <th><%= rsmd.getColumnLabel(i)%></th>
                    <% } %>
            </tr>
            <% while (rs.next()) { %>
            <tr>
                <% for (int i = 1; i <= rsmd.getColumnCount(); i++) { %>
                <%-- Recuperamos los valores de las columnas que
                corresponden a cada uno de los registros de la
                tabla. Hay que recoger correctamente el tipo de
                dato que contiene la columna --%>
                <% if (i == 3) {%>
                <td><%= rs.getInt(i)%></td>
                <% } else {%>
                <td><%= rs.getString(i)%></td>
                <% }
                    } %>
            </tr>
            <% }%>
        </table>
    </body>
</html>
