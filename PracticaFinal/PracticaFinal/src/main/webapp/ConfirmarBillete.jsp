<%-- 
    Document   : ConfirmarBillete
    Created on : 15 ene 2022, 22:37:42
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
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar Billete</title>
        <link rel="stylesheet" href="./css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="./js/CompraBillete.js"></script>
    </head>
    <body>
        <% 
        String origen = request.getParameter("origen");
        String destino = request.getParameter("destino");
        String tipo = request.getParameter("tipo");
        int MesIDA = Integer.valueOf(request.getParameter("MesIDA"));
        int MesVUELTA = Integer.valueOf(request.getParameter("MesVuelta"));

        //if (origen != null && destino != null && tipo != null && MesIDA != null && MesVuelta != null) {
        //} else {
        //    out.println("No se han recibido los datos");
        //}
        
        c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app"); 
        %>
        <section class="seccion">
            <h1> <img src="./resources/images/logo.png" alt="Logo" width="100" height="100"> </h1>
            <h1>Compra Billete</h1>
            <!-- Tabla que continene 7 filas. La primera son dos comboboxes la segunda son dos radio buttons, la tercera dos capos de fecha, y la quinta un boton-->
            <form action="ConfirmarCompra.jsp" method="post">
                <table>
                    <tr>
                        <td>
                            <%
                            s = c.createStatement();
                            //origen = session.getAttribute("origen").toString();
                            //destino = session.getAttribute("destino").toString();
                            
                            Date limiteInferiorIDA = new Date(122,MesIDA-1,1);
                            int DiaMesIDA = 28;
                            if (MesIDA != 2){
                                if (MesIDA == 1|| MesIDA == 3|| MesIDA == 5|| MesIDA == 7|| MesIDA == 8|| MesIDA == 10|| MesIDA == 12) DiaMesIDA = 31;
                                if (MesIDA == 4|| MesIDA == 6|| MesIDA == 9|| MesIDA == 11) DiaMesIDA = 30;
                            }
                            Date limiteSuperiorIDA = new Date(122,MesIDA-1,DiaMesIDA);

                            String query = "SELECT COUNT(*) FROM APP.VUELO WHERE VUELO.ORIGEN = '" + origen + "' AND VUELO.DESTINO = '" + destino + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                            //System.out.println(query);
                            rs = s.executeQuery(query);
                            
                            /*while (rs.next()) {
                                System.out.println(rs.getDate("FECHA"));
                            }*/
                            int rowNumber = 0;
                            while (rs.next()){
                                rowNumber = rs.getInt("1");
                            }
                            
                            //rsmd = rs.getMetaData();
                            %>
                            <select class="select" id="origen" name="fechasIDA" >
                                <%
                                if(rowNumber > 0) {
                                    query = "SELECT VUELO.FECHA FROM APP.VUELO WHERE VUELO.ORIGEN = '" + origen + "' AND VUELO.DESTINO = '" + destino + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                                    rs = s.executeQuery(query);
                                    while (rs.next()) {
                                %>
                                    <%-- Recuperamos los valores de las columnas que
                                    corresponden a cada uno de los registros de la
                                    tabla. Hay que recoger correctamente el tipo de
                                    dato que contiene la columna --%>
                                    <option id="<%= rs.getDate("FECHA").toString() %>"><%= rs.getDate("FECHA").toString() %></option>
                                <%
                                    }
                                } else {
                                %>
                                    <option id="NV">No hay vuelos disponibles</option>
                                <%
                                }
                                %>
                            </select>
                        </td>
                        <td>
                            <%
                            s = c.createStatement();
                            //origen = session.getAttribute("origen").toString();
                            //destino = session.getAttribute("destino").toString();
                            
                            Date limiteInferiorVUELTA = new Date(122,MesVUELTA-1,1);
                            int DiaMesVUELTA = 28;
                            if (MesVUELTA != 2){
                                if (MesVUELTA == 1|| MesVUELTA == 3|| MesVUELTA == 5|| MesVUELTA == 7|| MesVUELTA == 8|| MesVUELTA == 10|| MesVUELTA == 12) DiaMesVUELTA = 31;
                                if (MesVUELTA == 4|| MesVUELTA == 6|| MesVUELTA == 9|| MesVUELTA == 11) DiaMesVUELTA = 30;
                            }
                            Date limiteSuperiorVUELTA = new Date(122,MesVUELTA-1,DiaMesVUELTA);

                            query = "SELECT COUNT(*) FROM APP.VUELO WHERE VUELO.ORIGEN = '" + destino + "' AND VUELO.DESTINO = '" + origen + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorVUELTA + "' AND '" + limiteSuperiorVUELTA + "'";
                            //System.out.println(query);
                            rs = s.executeQuery(query);
                            
                            /*while (rs.next()) {
                                System.out.println(rs.getDate("FECHA"));
                            }*/
                            rowNumber = 0;
                            while (rs.next()){
                                rowNumber = rs.getInt("1");
                            }
                            
                            //rsmd = rs.getMetaData();
                            //System.out.println(tipo);
                            if (tipo.equals("ida+vuelta")) {
                            %>
                            <select class="select" id="origen" name="fechasVUELTA" >
                                <%
                                if(rowNumber > 0) {
                                    query = "SELECT VUELO.FECHA FROM APP.VUELO WHERE VUELO.ORIGEN = '" + destino + "' AND VUELO.DESTINO = '" + origen + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                                    rs = s.executeQuery(query);
                                    while (rs.next()) {
                                %>
                                    <%-- Recuperamos los valores de las columnas que
                                    corresponden a cada uno de los registros de la
                                    tabla. Hay que recoger correctamente el tipo de
                                    dato que contiene la columna --%>
                                    <option id="<%= rs.getDate("FECHA").toString() %>"><%= rs.getDate("FECHA").toString() %></option>
                                <%
                                    }
                                } else {
                                %>
                                    <option id="NV">No hay vuelos disponibles</option>
                                <%
                                }
                                %>
                            </select>
                            <%
                            } else {
                            %>
                            <select class="select" id="origen" name="fechasIDA" hidden>
                                <%
                                if(rowNumber > 0) {
                                    query = "SELECT VUELO.FECHA FROM APP.VUELO WHERE VUELO.ORIGEN = '" + destino + "' AND VUELO.DESTINO = '" + origen + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                                    rs = s.executeQuery(query);
                                    while (rs.next()) {
                                %>
                                    <%-- Recuperamos los valores de las columnas que
                                    corresponden a cada uno de los registros de la
                                    tabla. Hay que recoger correctamente el tipo de
                                    dato que contiene la columna --%>
                                    <option id="<%= rs.getDate("FECHA").toString() %>"><%= rs.getDate("FECHA").toString() %></option>
                                <%
                                    }
                                } else {
                                %>
                                    <option id="NV">No hay vuelos disponibles</option>
                                <%
                                }
                                %>
                            </select>
                        </td>
                        <%
                        }
                        %>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" name="pasajeors" value="pasajeros" checked onclick="showFields()">
                            <label for="tipo">Pasajeros</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Consultar" class="myButton" name="consultar">
                        </td>
                    </tr>
                </table>
            </form>
        </section>
    </body>
</html>
