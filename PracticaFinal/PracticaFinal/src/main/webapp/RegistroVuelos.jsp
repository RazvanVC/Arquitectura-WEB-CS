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
                ResultSetMetaData rsmd;
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
                rs = s.executeQuery("SELECT * FROM APP.VUELOS");
                rsmd = rs.getMetaData();
                double Ganancia=0;
                double Ocupacion=0;
                double GananciaVuelo=0;
                double NumAsientos=0;
                double NumPasajeros=0;
                int Filas=0;
            %>
        <header class="encabezado">
            <h1> <img src="./img/logo.png"  alt="Logo" width="300" height="300"> </h1>
            <h2>Registro de los vuelos</h2>
        </header>
        <section class="seccion">
            <form action="/PracticaFinal/DetallesVuelos.jsp" method="post">
                <h2> Puedes buscar los datos de un vuelo en especifico aquí abajo: </h2>
                        <label for="Id_vuelo">Id_vuelo:</label>
                        <input type="text" name="Id_vuelo" id="Id_vuelo"/>
                        <input type="submit" value="Buscar"/>
                    </tr>
                </table>
            <form>
                <h2> Datos sobre toda la aerolinea:</h2>
                <table>
                        <% while (rs.next()) { %>
                        <%Filas = Filas + 1 ;%>
                        <tr class="tr2">
                            <% for (int i = 1; i <= rsmd.getColumnCount(); i++) { %>
                                        <% if (i == 5) {%>
                                            <%} NumAsientos=rs.getInt("NUM_ASIENTOS")%>
                                        <%} else if (i == 6) {%>
                                            <%= NumPasajeros=rs.getInt("NUM_PASAJEROS")%>
                                            <%=Ocupacion= Ocupacion + (NumPasajeros)/(NumAsientos) %>
                                        <%} else if (i == 8) {%>
                                            <%= GananciaVuelo=rs.getInt("GANANCIA")%>
                                            <%= Ganancia=(Ganancia + GananciaVuelo)%>
                                        }
                                <% }
                        }%>
                    <tr>
                    <td><label for="Num_viajeros_medio">Numero Viajeros Medio:</label></td> 
                    <td class td2><%((Ocupacion/Filas)*100)%>%</td>
                    <!--Bucle en cada iteración:
                        X= 0;
                        X= X+ Query(NumViajerosBuelo/NumAsientos)
                        Sale bucle
                        X/NumIteraciones-->
                    </tr>
                    <tr>
                    <td><label for="Total_ganancias_medio">Total Ganancias por vuelo Medio:</label></td>
                    <td class td2><%(Ganancia/Filas)%>€</td> 
                    <!--Bucle en cada iteración:
                        X= 0;
                        X= X+ Query(Ganancias)
                        Sale bucle
                        X/NumIteraciones-->
                    </tr>
                    <tr>
                    <td><label for="Total_ganancias">Total Ganancias Empresa:</label></td>
                    <td class td2><%(Ganancia)%>€</td> 
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
