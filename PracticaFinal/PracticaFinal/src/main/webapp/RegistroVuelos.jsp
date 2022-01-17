<%-- 
    Document   : RegistroVuelos
    Created on : 15-ene-2022, 14:27:16
    Author     : PC
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css">
        <title>Registro Vuelos</title>
    </head>
    <body>
         <%
            // Inicialización de las variables necesarias para la
            // conexión a la base de datos y realización de consultas
            c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            //c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample?,?app?,?app");
            s = c.createStatement();
            rs = s.executeQuery("SELECT * FROM APP.VUELO");
            double Ganancia=0;
            double Ocupacion=0;
            double GananciaVuelo=0;
            int Filas=0;
        %>
        <header class="encabezado">
            <h1> <img src="./img/logo.png"  alt="Logo" width="300" height="300"> </h1>
            <h2>Registro de los vuelos</h2>
        </header>
        <section class="seccion">
            <form action="/PracticaFinal/DetalleVuelos.jsp" method="post">
                <h2> Puedes buscar los datos de un vuelo en especifico aquí abajo: </h2>
                <label for="id_vuelo">Id Vuelo:</label>
                <input type="text" name="id_vuelo" id="id_vuelo"/>
                <input type="submit" value="Buscar"/>
            </form>
            <h2> Datos sobre toda la aerolinea:</h2>
            <table class="table2">
                <%
                while (rs.next()){
                    Filas++;
                    int NumAsientos = rs.getInt("NUM_ASIENTOS");
                    int NumPasajeros=rs.getInt("NUM_PASAJEROS");
                    Ocupacion= Ocupacion + (NumPasajeros)/(NumAsientos);
                    GananciaVuelo=rs.getInt("GANANCIA");
                    Ganancia=(Ganancia + GananciaVuelo);
                }
                %>
                <tr class="tr2">
                    <td class="td2">Numero Viajeros Medio:</td> 
                    <td class="td2"><%=String.valueOf((Ocupacion/Filas)*100)%>%</td>
                </tr>
                <!--Bucle en cada iteración:
                    X= 0;
                    X= X+ Query(NumViajerosBuelo/NumAsientos)
                    Sale bucle
                    X/NumIteraciones-->
                <tr class="tr2">
                    <td class="td2">Total Ganancias por vuelo Medio:</td>
                    <td class="td2"><%=String.valueOf(Ganancia/Filas)%>€</td> 
                <!--Bucle en cada iteración:
                    X= 0;
                    X= X+ Query(Ganancias)
                    Sale bucle
                    X/NumIteraciones-->
                </tr>
                <tr class="tr2">
                    <td class="td2">Total Ganancias Empresa:</td>
                    <td class="td2"><%=String.valueOf(Ganancia)%>€</td> 
                <!--Bucle en cada iteración:
                    X= 0;
                    X= X+ Query(Ganancia)-->   
                <tr>
            </table>
            </form>
            <button class="myButton2" onclick="location.href = './AdminMainMenu.html'">Volver a la página de Administrador</button>
        </section>
    </body>
</html>
