<%-- 
    Document   : CalculoFinal.jsp
    Created on : 16 dic 2021, 13:08:53
    Author     : razvanvc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <section class="seccion">
            <%
                String val = request.getParameter("coche");
                String val2 = request.getParameter("circuito");

                if (val != null) {
                    session.setAttribute("Coche", val);
                }
                if (val2 != null) {
                    session.setAttribute("Circuito", val2);
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
                int ganancia = 0;
                int numeroVueltas = 0;
                int numeroCurvas = 0;
                rs = s.executeQuery("SELECT * FROM APP.COCHE WHERE COCHE.NOMBRE='" + session.getAttribute("Coche") + "' FETCH FIRST 1 ROWS ONLY");
                while (rs.next()) {
                    ganancia = rs.getInt("GANANCIAXCURVA");
                }
                s = c.createStatement();
                rs = s.executeQuery("SELECT * FROM APP.CIRCUITO WHERE CIRCUITO.NOMBRE='" + session.getAttribute("Circuito") + "' FETCH FIRST 1 ROWS ONLY");
                while (rs.next()) {
                    numeroCurvas = rs.getInt("NCURVASVUELTA");
                    numeroVueltas = rs.getInt("NVUELTAS");
                }
                session.setAttribute("GananciaTotal", ganancia*numeroVueltas*numeroCurvas);
            %>
            <h1> La ganancia de potencia es de: <%=session.getAttribute("GananciaTotal")%> </h1>
                <br>
                <button class="myButton" onclick="location.href='./index.html'">Volver al menú</button>
        </section>

    </body>
</html>
