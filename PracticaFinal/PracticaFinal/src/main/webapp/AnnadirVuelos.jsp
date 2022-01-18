<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<%!
    // Declaraciones de las variables utilizadas para la
    // conexión a la base de datos y para la recuperación de
    // datos de las tablas
    Connection c;
    Statement s;
    ResultSet rs;
    ResultSetMetaData rsmd;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Vuelos</title>
        <link rel="stylesheet" href="./css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="./js/main.js"></script>
    </head>

    <body>
        <%
            // Inicialización de las variables necesarias para la
            // conexión a la base de datos y realización de consultas

            c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            //c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample?,?app?,?app");
            s = c.createStatement();
            boolean registro = true;


        %>
        <section class="seccion">
            <h1> <img src="./img/logo.png" alt="Logo" width="300" height="300"> </h1>
            <form action="">
                <table class="table4">
                    <tr class="tr4">
                        <td class="td">
                            <input type="radio" id="Ruta" name="tipo" value="ruta" checked onclick="showFieldsTipoVuelo()">
                            <label for="Ruta">Ruta</label>
                        </td>
                        <td class ="td">
                            <input type="radio" id="Vuelo" name="tipo" value="vuelo" onclick="showFieldsTipoVuelo()">
                            <label for="Vuelo">Vuelo</label>
                        </td>
                    </tr>
                    <tr class="tr4">
                        <%                            rs = s.executeQuery("SELECT ORIGEN.NOMBRE FROM APP.ORIGEN");
                        %>
                        <td>
                            <h1>Origen del Vuelo</h1>
                            <label >Seleccione Origen del Lugar: </label>
                            <select name="LugarOrigen">
                                <% while (rs.next()) {%>

                                <%-- Recuperamos los valores de las columnas que
                                corresponden a cada uno de los registros de la
                                tabla. Hay que recoger correctamente el tipo de
                                dato que contiene la columna --%>
                                <option><%= rs.getString("NOMBRE")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                        <%
                            rs = s.executeQuery("SELECT DESTINO.NOMBRE FROM APP.DESTINO");
                        %>
                        <td>
                            <h2>Destino del Vuelo</h2>
                            <label>Seleccione Destino del Destino: </label>
                            <select name="LugarDestino">
                                <% while (rs.next()) {%>
                                <%-- Recuperamos los valores de las columnas que
                                corresponden a cada uno de los registros de la
                                tabla. Hay que recoger correctamente el tipo de
                                dato que contiene la columna --%>
                                <option><%= rs.getString("NOMBRE")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>

                    <tr class="tr4">
                        <td>
                            <label for="FechaFinal" id="lblFechaInicioT">Fecha inicio temporalidad</label>
                            <label for="FechaFinal" id="lblFechaInicioV" hidden="">Fecha vuelo</label>
                            <input type="date" id="FechaInicio" name="FechaInicio" value="" required>
                        </td>
                        <td>
                            <label for="FechaFinal" id="lblFechaFinal">Fecha fin temporalidad</label>
                            <input type="date" id="FechaFinal" name="FechaFinal" value="">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Temporalidad" id="lblTemporalidad" >Temporalidad: </label>
                            <input type="number" id="Temporalidad" name="Temporalidad" value="1" min="1">
                        </td>
                    </tr>
                    <!-- 
                    <tr>
                        <td>
                            <input type="radio" id="PrecioRecomendado" name="precio" value="precio_recomendado" onclick="showFieldsPrecio()" checked="checked">
                            <label for="PrecioRecomendado">Precio Recomendado</label>
                        </td>
                        <td>
                            <input type="radio" id="PrecioCustomizado" name="precio" value="precio_customizado" onclick="showFieldsPrecio()">
                            <label for="PrecioCustomizado">Precio Customizado</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="PrecioBillete" id="lblPrecio" hidden>Precio: </label>
                            <input type="number" id="PrecioBillete" name="PrecioBillete" value="100" hidden>
                        </td>
                    </tr> -->
                    <tr clas=tr2>
                        <td class="td2">
                            <label for="PrecioBillete" id="lblPrecio" >Precio: </label>
                            <input type="number" id="PrecioBillete" name="PrecioBillete" value="100" >
                        </td>
                    </tr>
                    <tr class="tr4">
                        <td>
                            <input type="submit" id="Confirmar" name="Confirmar" value="Confimar">
                        </td>
                    </tr>
                </table>
                <button class="myButton2" onclick="location.href = './v9'">Volver a la página de Administrador</button>
            </form> 
        </section> 

        <%
            //-------rs = s.executeUpdate("INSERT INTO APP.ORIGEN.NOMBRE VALUES(origen);");
            //-------rs = s.executeUpdate("INSERT INTO APP.DESTINO.NOMBRE VALUES(destino)");
            if (request.getParameter("Confirmar") != null) {
                String query = "";
                String tipo = request.getParameter("tipo");
                if (tipo.equals("ruta")) {
                    String origen = request.getParameter("LugarOrigen");
                    String destino = request.getParameter("LugarDestino");
                    Date inicio = Date.valueOf(request.getParameter("FechaInicio"));
                    Date fin = Date.valueOf(request.getParameter("FechaFinal"));
                    int temporalidad = Integer.valueOf(request.getParameter("Temporalidad"));
                    Double precioBillete = Double.valueOf(request.getParameter("PrecioBillete"));

                    Calendar cInicio = Calendar.getInstance();
                    cInicio.setTime(inicio);
                    //Calendar cFinal = Calendar.getInstance();
                    //cFinal.setTime(fin);
                    query = "SELECT VUELO.ID_VUELO FROM APP.VUELO WHERE VUELO.ORIGEN='" + origen + "' AND VUELO.DESTINO = '" + destino + "' ORDER BY VUELO.ID_VUELO DESC FETCH FIRST ROW ONLY";
                    rs = s.executeQuery(query);
                    String IDVueloIDA = "";
                    if (rs.next()) {
                        IDVueloIDA = rs.getString("ID_VUELO");
                    } else {
                        IDVueloIDA
                                = String.valueOf(origen.toUpperCase().charAt(0))
                                + String.valueOf(origen.toUpperCase().charAt(1))
                                + String.valueOf(origen.toUpperCase().charAt(2))
                                + String.valueOf(destino.toUpperCase().charAt(0))
                                + String.valueOf(destino.toUpperCase().charAt(1))
                                + String.valueOf(destino.toUpperCase().charAt(2))
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0);
                    }
                    query = "SELECT VUELO.ID_VUELO FROM APP.VUELO WHERE VUELO.ORIGEN='" + destino + "' AND VUELO.DESTINO = '" + origen + "' ORDER BY VUELO.ID_VUELO DESC FETCH FIRST ROW ONLY";
                    rs = s.executeQuery(query);
                    String IDVueloVUELTA = "";
                    if (rs.next()) {
                        IDVueloVUELTA = rs.getString("ID_VUELO");
                    } else {
                        IDVueloVUELTA
                                = String.valueOf(destino.toUpperCase().charAt(0))
                                + String.valueOf(destino.toUpperCase().charAt(1))
                                + String.valueOf(destino.toUpperCase().charAt(2))
                                + String.valueOf(origen.toUpperCase().charAt(0))
                                + String.valueOf(origen.toUpperCase().charAt(1))
                                + String.valueOf(origen.toUpperCase().charAt(2))
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0);
                    }
                    while (inicio.before(fin)) {
                        System.out.print("REVIENTO");
                        Date tmpIDA = inicio;
                        cInicio.add(Calendar.DAY_OF_MONTH, 1);
                        Date tmpVUELTA = new Date(cInicio.getTimeInMillis());
                        //AUMENTAR ID IDA
                        String tmpIDIDA = IDVueloIDA.substring(6);
                        int NtmpIDIDA = Integer.valueOf(tmpIDIDA);
                        NtmpIDIDA++;
                        tmpIDIDA = String.valueOf(NtmpIDIDA);
                        String tmpFinal = "";
                        int i = 6;
                        while (i > tmpIDIDA.length()) {
                            tmpFinal = tmpFinal.concat("0");
                            i--;
                        }
                        IDVueloIDA = String.valueOf(origen.toUpperCase().charAt(0))
                                + String.valueOf(origen.toUpperCase().charAt(1))
                                + String.valueOf(origen.toUpperCase().charAt(2))
                                + String.valueOf(destino.toUpperCase().charAt(0))
                                + String.valueOf(destino.toUpperCase().charAt(1))
                                + String.valueOf(destino.toUpperCase().charAt(2))
                                + tmpFinal.concat(tmpIDIDA);

                        //AUMENTA ID VUELTA
                        String tmpIDVUELTA = IDVueloVUELTA.substring(6);
                        int NtmpIDVUELTA = Integer.valueOf(tmpIDVUELTA);
                        NtmpIDVUELTA++;
                        tmpIDVUELTA = String.valueOf(NtmpIDVUELTA);
                        tmpFinal = "";
                        i = 6;
                        while (i > tmpIDVUELTA.length()) {
                            tmpFinal = tmpFinal.concat("0");
                            i--;
                        }
                        IDVueloVUELTA = String.valueOf(destino.toUpperCase().charAt(0))
                                + String.valueOf(destino.toUpperCase().charAt(1))
                                + String.valueOf(destino.toUpperCase().charAt(2))
                                + String.valueOf(origen.toUpperCase().charAt(0))
                                + String.valueOf(origen.toUpperCase().charAt(1))
                                + String.valueOf(origen.toUpperCase().charAt(2))
                                + tmpFinal.concat(tmpIDVUELTA);

                        //QUERY DE IDA
                        query = "INSERT INTO APP.VUELO (ID_VUELO, ORIGEN, DESTINO,FECHA,NUM_ASIENTOS,NUM_PASAJEROS,PRECIO_BILLETE,GANANCIA,TASAS_TOTALES_AEROPUERTOS,IMPUESTOS_TOTALES) VALUES"
                                + "('" + IDVueloIDA + "','" + origen + "','" + destino + "','" + tmpIDA + "',75,00," + precioBillete + ",0,0,0)";
                        System.out.print("query");
                        s.executeUpdate(query);
                        //QUERY DE VUELTA
                        query = "INSERT INTO APP.VUELO (ID_VUELO, ORIGEN, DESTINO,FECHA,NUM_ASIENTOS,NUM_PASAJEROS,PRECIO_BILLETE,GANANCIA,TASAS_TOTALES_AEROPUERTOS,IMPUESTOS_TOTALES) VALUES"
                                + "('" + IDVueloVUELTA + "','" + destino + "','" + origen + "','" + tmpVUELTA + "',75,00," + precioBillete + ",0,0,0)";
                        System.out.print("query");
                        s.executeUpdate(query);

                        //Modificacion de parametros
                        cInicio.add(Calendar.DAY_OF_MONTH, -1);//Regreso a la fecha original por la insercion de vuelta
                        cInicio.add(Calendar.DAY_OF_MONTH, temporalidad);
                        inicio = new Date(cInicio.getTimeInMillis());
                        cInicio.setTime(inicio);
                    }
                    response.sendRedirect("/PracticaFinal/AcceptQuery.html");
                } else {
                    String origen = request.getParameter("LugarOrigen");
                    String destino = request.getParameter("LugarDestino");
                    Date inicio = Date.valueOf(request.getParameter("FechaInicio"));
                    Double precioBillete = Double.valueOf(request.getParameter("PrecioBillete"));

                    Calendar cInicio = Calendar.getInstance();
                    cInicio.setTime(inicio);
                    //Calendar cFinal = Calendar.getInstance();
                    //cFinal.setTime(fin);
                    query = "SELECT VUELO.ID_VUELO FROM APP.VUELO WHERE VUELO.ORIGEN='" + origen + "' AND VUELO.DESTINO = '" + destino + "' ORDER BY VUELO.ID_VUELO DESC FETCH FIRST ROW ONLY";
                    rs = s.executeQuery(query);
                    String IDVueloIDA = "";
                    if (rs.next()) {
                        IDVueloIDA = rs.getString("ID_VUELO");
                    } else {
                        IDVueloIDA
                                = String.valueOf(origen.toUpperCase().charAt(0))
                                + String.valueOf(origen.toUpperCase().charAt(1))
                                + String.valueOf(origen.toUpperCase().charAt(2))
                                + String.valueOf(destino.toUpperCase().charAt(0))
                                + String.valueOf(destino.toUpperCase().charAt(1))
                                + String.valueOf(destino.toUpperCase().charAt(2))
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0);
                    }

                    query = "SELECT VUELO.ID_VUELO FROM APP.VUELO WHERE VUELO.ORIGEN='" + destino + "' AND VUELO.DESTINO = '" + origen + "' ORDER BY VUELO.ID_VUELO DESC FETCH FIRST ROW ONLY";
                    rs = s.executeQuery(query);
                    String IDVueloVUELTA = "";
                    if (rs.next()) {
                        IDVueloVUELTA = rs.getString("ID_VUELO");
                    } else {
                        IDVueloVUELTA
                                = String.valueOf(destino.toUpperCase().charAt(0))
                                + String.valueOf(destino.toUpperCase().charAt(1))
                                + String.valueOf(destino.toUpperCase().charAt(2))
                                + String.valueOf(origen.toUpperCase().charAt(0))
                                + String.valueOf(origen.toUpperCase().charAt(1))
                                + String.valueOf(origen.toUpperCase().charAt(2))
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0)
                                + String.valueOf(0);
                    }

                    System.out.print("REVIENTO");
                    Date tmpIDA = inicio;
                    cInicio.add(Calendar.DAY_OF_MONTH, 1);
                    Date tmpVUELTA = new Date(cInicio.getTimeInMillis());
                    //AUMENTAR ID IDA
                    String tmpIDIDA = IDVueloIDA.substring(6);
                    int NtmpIDIDA = Integer.valueOf(tmpIDIDA);
                    NtmpIDIDA++;
                    tmpIDIDA = String.valueOf(NtmpIDIDA);
                    String tmpFinal = "";
                    int i = 6;
                    while (i > tmpIDIDA.length()) {
                        tmpFinal = tmpFinal.concat("0");
                        i--;
                    }
                    IDVueloIDA = String.valueOf(origen.toUpperCase().charAt(0))
                            + String.valueOf(origen.toUpperCase().charAt(1))
                            + String.valueOf(origen.toUpperCase().charAt(2))
                            + String.valueOf(destino.toUpperCase().charAt(0))
                            + String.valueOf(destino.toUpperCase().charAt(1))
                            + String.valueOf(destino.toUpperCase().charAt(2))
                            + tmpFinal.concat(tmpIDIDA);

                    //AUMENTA ID VUELTA
                    String tmpIDVUELTA = IDVueloVUELTA.substring(6);
                    int NtmpIDVUELTA = Integer.valueOf(tmpIDVUELTA);
                    NtmpIDVUELTA++;
                    tmpIDVUELTA = String.valueOf(NtmpIDVUELTA);
                    tmpFinal = "";
                    i = 6;
                    while (i > tmpIDVUELTA.length()) {
                        tmpFinal = tmpFinal.concat("0");
                        i--;
                    }
                    IDVueloVUELTA = String.valueOf(destino.toUpperCase().charAt(0))
                            + String.valueOf(destino.toUpperCase().charAt(1))
                            + String.valueOf(destino.toUpperCase().charAt(2))
                            + String.valueOf(origen.toUpperCase().charAt(0))
                            + String.valueOf(origen.toUpperCase().charAt(1))
                            + String.valueOf(origen.toUpperCase().charAt(2))
                            + tmpFinal.concat(tmpIDVUELTA);

                    //QUERY DE IDA
                    query = "INSERT INTO APP.VUELO (ID_VUELO, ORIGEN, DESTINO,FECHA,NUM_ASIENTOS,NUM_PASAJEROS,PRECIO_BILLETE,GANANCIA,TASAS_TOTALES_AEROPUERTOS,IMPUESTOS_TOTALES) VALUES"
                            + "('" + IDVueloIDA + "','" + origen + "','" + destino + "','" + tmpIDA + "',75,00," + precioBillete + ",0,0,0)";
                    System.out.print("query");
                    s.executeUpdate(query);
                    //QUERY DE VUELTA
                    query = "INSERT INTO APP.VUELO (ID_VUELO, ORIGEN, DESTINO,FECHA,NUM_ASIENTOS,NUM_PASAJEROS,PRECIO_BILLETE,GANANCIA,TASAS_TOTALES_AEROPUERTOS,IMPUESTOS_TOTALES) VALUES"
                            + "('" + IDVueloVUELTA + "','" + destino + "','" + origen + "','" + tmpVUELTA + "',75,00," + precioBillete + ",0,0,0)";
                    System.out.print("query");
                    s.executeUpdate(query);

                    response.sendRedirect("/PracticaFinal/AcceptQuery.html");
                }
            }
        %>

    </body>        
</html>