<%-- 
    Document   : ConfirmarBillete
    Created on : 15 ene 2022, 22:37:42
    Author     : razvanvc
--%>

<%@page import="java.util.Enumeration"%>
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

    </head>
    <body>
        <%
            int MesIDA = Integer.valueOf(session.getAttribute("MesIDA").toString());
            int MesVUELTA = Integer.valueOf(session.getAttribute("MesVUELTA").toString());
            String origen = String.valueOf(session.getAttribute("origen"));
            String destino = String.valueOf(session.getAttribute("destino"));
            String tipo = String.valueOf(session.getAttribute("tipo"));

            //if (origen != null && destino != null && tipo != null && MesIDA != null && MesVuelta != null) {
            //} else {
            //    out.println("No se han recibido los datos");
            //}
            c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            s = c.createStatement();
        %>
        <header class="encabezado">
            <h1> <img src="./img/logo.png" alt="Logo" width="300" height="300"> </h1>
            <h2>Confirmación del Billete</h2>
        </header>
        <section class="seccion">
            
            <!-- Tabla que continene 7 filas. La primera son dos comboboxes la segunda son dos radio buttons, la tercera dos capos de fecha, y la quinta un boton-->
            <form action="">
            <br/>
                            <%
                                //origen = session.getAttribute("origen").toString();
                                //destino = session.getAttribute("destino").toString();
                                Date limiteInferiorIDA = new Date(122, MesIDA - 1, 1);
                                int DiaMesIDA = 28;

                                if (MesIDA != 2) {
                                    if (MesIDA == 1 || MesIDA == 3 || MesIDA == 5 || MesIDA == 7 || MesIDA == 8 || MesIDA == 10 || MesIDA == 12) {
                                        DiaMesIDA = 31;
                                    }
                                    if (MesIDA == 4 || MesIDA == 6 || MesIDA == 9 || MesIDA == 11) {
                                        DiaMesIDA = 30;
                                    }
                                }
                                Date limiteSuperiorIDA = new Date(122, MesIDA - 1, DiaMesIDA);

                                String query = "SELECT COUNT(*) FROM APP.VUELO WHERE VUELO.ORIGEN = '" + origen + "' AND VUELO.DESTINO = '" + destino + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                                //System.out.println(query);
                                rs = s.executeQuery(query);

                                /*while (rs.next()) {
                                System.out.println(rs.getDate("FECHA"));
                            }*/
                                int rowNumber = 0;
                                while (rs.next()) {
                                    rowNumber = rs.getInt("1");
                                }

                                //rsmd = rs.getMetaData();
                            %>
                            <select class="select" id="origen" name="fechaIDA" >
                                <%                                    if (rowNumber > 0) {
                                        query = "SELECT VUELO.FECHA FROM APP.VUELO WHERE VUELO.ORIGEN = '" + origen + "' AND VUELO.DESTINO = '" + destino + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                                        rs = s.executeQuery(query);
                                        while (rs.next()) {
                                %>
                                <%-- Recuperamos los valores de las columnas que
                                corresponden a cada uno de los registros de la
                                tabla. Hay que recoger correctamente el tipo de
                                dato que contiene la columna --%>
                                <option id="<%= rs.getDate("FECHA").toString()%>"><%= rs.getDate("FECHA").toString()%></option>

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
                                s = c.createStatement();
                                //origen = session.getAttribute("origen").toString();
                                //destino = session.getAttribute("destino").toString();

                                Date limiteInferiorVUELTA = new Date(122, MesVUELTA - 1, 1);
                                int DiaMesVUELTA = 28;
                                if (MesVUELTA != 2) {
                                    if (MesVUELTA == 1 || MesVUELTA == 3 || MesVUELTA == 5 || MesVUELTA == 7 || MesVUELTA == 8 || MesVUELTA == 10 || MesVUELTA == 12) {
                                        DiaMesVUELTA = 31;
                                    }
                                    if (MesVUELTA == 4 || MesVUELTA == 6 || MesVUELTA == 9 || MesVUELTA == 11) {
                                        DiaMesVUELTA = 30;
                                    }
                                }
                                Date limiteSuperiorVUELTA = new Date(122, MesVUELTA - 1, DiaMesVUELTA);

                                query = "SELECT COUNT(*) FROM APP.VUELO WHERE VUELO.ORIGEN = '" + destino + "' AND VUELO.DESTINO = '" + origen + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorVUELTA + "' AND '" + limiteSuperiorVUELTA + "'";
                                //System.out.println(query);
                                rs = s.executeQuery(query);

                                /*while (rs.next()) {
                                System.out.println(rs.getDate("FECHA"));
                            }*/
                                rowNumber = 0;
                                while (rs.next()) {
                                    rowNumber = rs.getInt("1");
                                }

                                //rsmd = rs.getMetaData();
                                //System.out.println(tipo);
                                if (tipo.equals("ida+vuelta")) {
                            %>
                            <select class="select" id="origen" name="fechaVUELTA" >
                                <%
                                    if (rowNumber > 0) {
                                        query = "SELECT VUELO.FECHA FROM APP.VUELO WHERE VUELO.ORIGEN = '" + destino + "' AND VUELO.DESTINO = '" + origen + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                                        rs = s.executeQuery(query);
                                        while (rs.next()) {
                                %>
                                <%-- Recuperamos los valores de las columnas que
                                corresponden a cada uno de los registros de la
                                tabla. Hay que recoger correctamente el tipo de
                                dato que contiene la columna --%>
                                <option id="<%= rs.getDate("FECHA").toString()%>"><%= rs.getDate("FECHA").toString()%></option>
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
                            <select class="select" id="origen" name="fechaVUELTA" hidden>
                                <%
                                    if (rowNumber > 0) {
                                        query = "SELECT VUELO.FECHA FROM APP.VUELO WHERE VUELO.ORIGEN = '" + destino + "' AND VUELO.DESTINO = '" + origen + "' AND VUELO.FECHA BETWEEN '" + limiteInferiorIDA + "' AND '" + limiteSuperiorIDA + "'";
                                        rs = s.executeQuery(query);
                                        while (rs.next()) {
                                %>
                                <%-- Recuperamos los valores de las columnas que
                                corresponden a cada uno de los registros de la
                                tabla. Hay que recoger correctamente el tipo de
                                dato que contiene la columna --%>
                                <option id="<%= rs.getDate("FECHA").toString()%>"><%= rs.getDate("FECHA").toString()%></option>
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
                            }
                        %>
                        <br/>
                        <br/>
                        <label for="tipo">Pasajeros</label>
                        <input type="number" name="pasajeros" requiered value="1">
                        <br/>
                        <br/>
                </table>
                <input type="submit" value="Consultar Vuelos" class="myButton3" name="confirmar">
            </form>
                        <br/>
                        <br/>
                        
            <button class="myButton3" onclick="location.href = './UserMainMenu.jsp'">Volver</button>
            <%
                try {
                //System.out.println(request.getPa);
                if (request.getParameter("confirmar") != null) {
                    String fechaIDA = request.getParameter("fechaIDA");
                    String fechaVUELTA = request.getParameter("fechaVUELTA");
                    System.out.println("DENTRO DE REQUEST COMPRA BILLETES");
                    System.out.print(request.getParameter("fechaIDA"));
                    System.out.print(request.getParameter("fechaVUELTA"));
                    System.out.print(request.getParameter("pasajeros"));
                    boolean next = false;
                    if (tipo.equals("ida")) {
                        boolean nextIDA = false;
                        Date fIDA = Date.valueOf(fechaIDA);
                        query = "SELECT VUELO.NUM_ASIENTOS, VUELO.ID_VUELO, VUELO.PRECIO_BILLETE FROM APP.VUELO WHERE VUELO.ORIGEN = '" + origen + "' AND VUELO.DESTINO = '" + destino + "' AND VUELO.FECHA = '" + fIDA + "'";
                        rs = s.executeQuery(query);
                        String id_vueloIDA = "";
                        Double precio_billeteIDA = 0.0;
                        while (rs.next()) {
                            if (rs.getInt("NUM_ASIENTOS") > Integer.valueOf(request.getParameter("pasajeros"))) {
                                nextIDA = true;
                                id_vueloIDA = rs.getString("ID_VUELO");
                                precio_billeteIDA = rs.getDouble("PRECIO_BILLETE");
                                break;
                            }
                        }
                        if (nextIDA) {
                            query = "SELECT USUARIOS.NUMERO_VIAJES FROM APP.USUARIOS WHERE USUARIOS.DNI ='" + session.getAttribute("DNI").toString() + "'";
                            rs = s.executeQuery(query);
                            int numeroViajes = 0;
                            while (rs.next()) {
                                numeroViajes = rs.getInt("NUMERO_VIAJES");
                            }
                            if ((numeroViajes + 1) % 3 == 0) {
                                precio_billeteIDA = precio_billeteIDA / 2;
                            }
                            session.setAttribute("fechaIDA", fIDA);
                            session.setAttribute("id_vueloIDA", id_vueloIDA);
                            session.setAttribute("precio_billeteIDA", precio_billeteIDA);
                            session.setAttribute("pasajeros", request.getParameter("pasajeros"));
                            response.sendRedirect("/PracticaFinal/ConfirmarCompra.jsp");
                        }
                    } else {
                        if (!fechaVUELTA.equals("No hay vuelos disponibles")) {
                            boolean nextIDA = false;
                            boolean nextVUELTA = false;
                            Date fIDA = Date.valueOf(fechaIDA);
                            Date fVUELTA = Date.valueOf(fechaVUELTA);
                            query = "SELECT VUELO.NUM_ASIENTOS, VUELO.ID_VUELO, VUELO.PRECIO_BILLETE FROM APP.VUELO WHERE VUELO.ORIGEN = '" + origen + "' AND VUELO.DESTINO = '" + destino + "' AND VUELO.FECHA = '" + fIDA + "'";
                            rs = s.executeQuery(query);
                            String id_vueloIDA = "";
                            Double precio_billeteIDA = 0.0;
                            while (rs.next()) {
                                if (rs.getInt("NUM_ASIENTOS") > Integer.valueOf(request.getParameter("pasajeros"))) {
                                    nextIDA = true;
                                    id_vueloIDA = rs.getString("ID_VUELO");
                                    precio_billeteIDA = rs.getDouble("PRECIO_BILLETE");
                                    break;
                                }
                            }
                            query = "SELECT VUELO.NUM_ASIENTOS, VUELO.ID_VUELO, VUELO.PRECIO_BILLETE FROM APP.VUELO WHERE VUELO.ORIGEN = '" + destino + "' AND VUELO.DESTINO = '" + origen + "' AND VUELO.FECHA = '" + fVUELTA + "'";
                            rs = s.executeQuery(query);
                            String id_vueloVUELTA = "";
                            Double precio_billeteVUELTA = 0.0;
                            while (rs.next()) {
                                if (rs.getInt("NUM_ASIENTOS") > Integer.valueOf(request.getParameter("pasajeros"))) {
                                    nextVUELTA = true;
                                    id_vueloVUELTA = rs.getString("ID_VUELO");
                                    precio_billeteVUELTA = rs.getDouble("PRECIO_BILLETE");
                                    break;
                                }
                            }
                            if (nextIDA && nextVUELTA) {
                                query = "SELECT USUARIOS.NUMERO_VIAJES FROM APP.USUARIOS WHERE USUARIOS.DNI ='" + session.getAttribute("DNI").toString() + "'";
                                rs = s.executeQuery(query);
                                int numeroViajes = 0;
                                while (rs.next()) {
                                    numeroViajes = rs.getInt("NUMERO_VIAJES");
                                }
                                if ((numeroViajes + 1) % 3 == 0) {
                                    precio_billeteIDA = precio_billeteIDA / 2;
                                    precio_billeteVUELTA = precio_billeteVUELTA / 2;
                                }
                                session.setAttribute("fechaIDA", fIDA);
                                session.setAttribute("fechaVUELTA", fVUELTA);
                                session.setAttribute("id_vueloIDA", id_vueloIDA);
                                session.setAttribute("id_vueloVUELTA", id_vueloVUELTA);
                                session.setAttribute("precio_billeteIDA", precio_billeteIDA);
                                session.setAttribute("precio_billeteVUELTA", precio_billeteVUELTA);
                                session.setAttribute("pasajeros", request.getParameter("pasajeros"));
                                response.sendRedirect("/PracticaFinal/ConfirmarCompra.jsp");
                            }
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Return Flights not available');");
                            out.println("location='ConfirmarBillete.jsp';");
                            out.println("</script>");
                        }

                    }
                }
                }catch (Exception e){
                    response.sendRedirect("/PracticaFinal/ErrorUsuario.html");
                }
            %>
        </section>

    </body>
</html>
