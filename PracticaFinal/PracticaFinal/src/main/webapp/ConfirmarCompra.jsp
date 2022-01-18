<%-- 
    Document   : ConfirmarCompra
    Created on : 14-ene-2022, 17:38:20
    Author     : PC
--%>

<%@page import="java.util.Random"%>
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
        <link rel="stylesheet" href="./css/style.css">
        <title>Copnfirmar Compra</title>
    </head>

    <body>

        <header class="encabezado">
            <h1> <img src="./img/logo.png" alt="Logo" width="300" height="300"> </h1>
            <h1>CONFIRMAR COMPRA DE BILLETES</h1>
        </header>
        <%
            int pasajeros = Integer.valueOf(session.getAttribute("pasajeros").toString());
            
            c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            s = c.createStatement();
        %>
        <section class="seccion">
            <h3>Rellene su(s) billete(s)</h3>
            <section class="seccion2">
                <form action="" method="">
                    <fieldset>
                        <!---Todo esto se genera de forma dinámica dependiendo del número de usuarios--->
                        <% 
                        int i = 1;
                        while (i<=pasajeros) { %>
                        <div>
                            <legend>Billete <%=i%></legend>
                            <label for="NombreBillete<%=i%>">Nombre:</label>
                            <input type="text" name="NombreBillete<%=i%>" id="NombreBillete<%=i%>" required="required" />
                            <label for="ApellidosBillete<%=i%>">Apellidos:</label>
                            <input type="text" name="ApellidosBillete<%=i%>" id="ApellidosBillete<%=i%>" required="required" />
                            <label for="DNIBillete<%=i%>"> DNI:</label>
                            <input type="text" name="DNIBillete<%=i%>" id="DNIBillete<%=i%>" required="required" />
                        </div>
                        <% 
                            i++;
                        }
                        %>
                        <h2>VISA</h2>
                        <table>
                            <tr>
                                <td>
                                    <label for= "NombreApellidosVisa"> Nombre y Apellidos:</label>
                                </td>
                                <td>
                                    <input type="text" name="NombreApellidosVisa" id= "NombreApellidosVisa" required="required" />
                                </td>  
                            </tr>
                            <tr>
                                <td>
                                <label for= "NumeroVisa"> Numero de la tarjeta:<label>
                                </td>
                                <td>
                                    <input type="text" name="NumeroVisa" id= "NumeroVisa" required="required" />
                                </td>  
                            </tr>
                            <tr>
                                <td>
                                    <label for= "FechaVisa"> Fecha Expiación:<label>
                                </td>
                                <td>
                                    <input type="month" name="FechaVisa" id= "FechaVisa" required="required" />
                                    </td>  
                                </tr>
                                <tr>
                                    <td>
                                    <label for= "NombreApellidosVisa"> CVV:<label>
                                    </td>
                                    <td>
                                    <input type="numeric" name="CVVVisa" id= "CVVisa" required="required" />
                                    </td>
                                </tr>
                        </table>
                        <input type="submit" value="Comprar" name="comprar" />
                    </fieldset>
                    <%
                    if (request.getParameter("comprar") != null) {
                        String tipo = session.getAttribute("tipo").toString();
                        String query = "";
                        if (tipo.equals("ida")){
                            i = 1;
                            //Parametros generales para la insercion
                            String id_vueloIDA = session.getAttribute("id_vueloIDA").toString();
                            String origen = session.getAttribute("origen").toString();
                            String destino = session.getAttribute("destino").toString();
                            Date fechaIDA = Date.valueOf(session.getAttribute("fechaIDA").toString());
                            String VISA = request.getParameter("NumeroVisa");
                            Double precio_billeteIDA = Double.valueOf(session.getAttribute("precio_billeteIDA").toString());
                            String dniComprador = session.getAttribute("DNI").toString();
                            
                            while (i<=pasajeros){
                                //Random ID
                                String idBilleteIDA;
                                Boolean idExists = true;
                                
                                //GENERACION DEL ID RANDOM UNICO
                                while (idExists) {
                                    Random random = new Random();
                                    char randomizedCharacter1 = (char) (random.nextInt(26) + 'a');
                                    char randomizedCharacter2 = (char) (random.nextInt(26) + 'a');
                                    int nrandom1 = random.nextInt(10);
                                    int nrandom2 = random.nextInt(10);
                                    int nrandom3 = random.nextInt(10);
                                    char dnileter = dniComprador.charAt(8);
                                
                                    idBilleteIDA = String.valueOf(randomizedCharacter1).toUpperCase()+String.valueOf(randomizedCharacter2).toUpperCase()+String.valueOf(nrandom1)+String.valueOf(nrandom2)+String.valueOf(nrandom3)+dnileter;
                                    
                                    //COMPROBACION DE QUE NO EXISTA EL IDA RANDOM EN LA BD
                                    query = "SELECT BILLETES.ID FROM APP.BILLETES WHERE BILLETES.ID = '"+idBilleteIDA+"' FETCH FIRST 1 ROWS ONLY";
                                    rs = s.executeQuery(query);
                                    if (rs.next()){
                                        if (!idBilleteIDA.equals(rs.getString("ID"))) {
                                            idExists = false;
                                            session.setAttribute("IDBilleteIDA"+i, idBilleteIDA);
                                        }
                                    } else {
                                        idExists = false;
                                        session.setAttribute("IDBilleteIDA"+i, idBilleteIDA);
                                    }
                                }
                                
                                //PARAMETROS INDIVIDUALES
                                idBilleteIDA = session.getAttribute("IDBilleteIDA"+i).toString();
                                String nombre = request.getParameter("NombreBillete"+i);
                                String apellido = request.getParameter("ApellidosBillete"+i);
                                String dni = request.getParameter("DNIBillete"+i);
                                //INSERCION DE LOS DATOS EN LA BASE DE DATOS
                                query = "INSERT INTO APP.BILLETES (ID, ID_VUELO, ORIGEN, DESTINO, FECHA, DNI, NOMBRE, APELLIDOS, NUMERO_VISA, PRECIO_BILLETE, DNI_COMPRADOR) "
                                        + "values('"+ idBilleteIDA +"','"+ id_vueloIDA +"','"+ origen +"','"+ destino +"','"+ fechaIDA +"','"+ dni +"','"+ nombre +"','"+ apellido +"','"+ VISA +"',"+ precio_billeteIDA +",'"+ dniComprador +"')";
                                s.executeUpdate(query);
                                
                                //GUARDADO DE DATOS INDIVIDUALES EN SESSION
                                session.setAttribute("IDBilleteIDA"+i, idBilleteIDA);
                                session.setAttribute("NombreBillete"+i, nombre);
                                session.setAttribute("ApellidosBillete"+i, apellido);
                                session.setAttribute("DNIBillete"+i, dni);
                                i++;
                            }
                            //RECUPERACION DE TASAS DE ORIGEN Y DESTINO
                            double tasaIDA = 0.0;
                            query = "SELECT ORIGEN.TASA FROM APP.ORIGEN WHERE ORIGEN.NOMBRE = '"+origen+"'";
                            
                            rs = s.executeQuery(query);
                            if (rs.next()){
                                tasaIDA=rs.getDouble("TASA")*pasajeros;
                            }
                            
                            //ACTUALIZACION DE TABLA USUARIOS
                            query = "SELECT USUARIOS.NUMERO_VIAJES FROM APP.USUARIOS WHERE USUARIOS.DNI = '"+session.getAttribute("DNI").toString()+"'";
                            rs = s.executeQuery(query);
                            int numeroViajes = 0;
                            if (rs.next()){
                                numeroViajes = rs.getInt("NUMERO_VIAJES");
                                numeroViajes++;
                            }
                            query = "UPDATE APP.USUARIOS SET USUARIOS.NUMERO_VIAJES = "+numeroViajes+" WHERE USUARIOS.DNI = '"+session.getAttribute("DNI").toString()+"'";
                            s.executeUpdate(query);
                            
                            //ACTUALIZACION DE TABLA VUELO
                            double tasasAeropuertos = 0.0;
                            int pasajerosExistentes = 0;
                            double ganancia = 0;
                            double impuestos = 0.0;
                            query = "SELECT VUELO.NUM_PASAJEROS, VUELO.GANANCIA, VUELO.TASAS_TOTALES_AEROPUERTOS, VUELO.IMPUESTOS_TOTALES FROM APP.VUELO WHERE VUELO.ID_VUELO = '"+id_vueloIDA+"'";
                            rs = s.executeQuery(query);
                            if (rs.next()){
                                tasasAeropuertos = rs.getDouble("TASAS_TOTALES_AEROPUERTOS");
                                pasajerosExistentes = rs.getInt("NUM_PASAJEROS");
                                ganancia = rs.getDouble("GANANCIA");
                                impuestos = rs.getDouble("IMPUESTOS_TOTALES");
                            }
                            tasasAeropuertos += (tasaIDA*pasajeros);
                            pasajerosExistentes += pasajeros;
                            ganancia += ((precio_billeteIDA/1.21)-tasaIDA)*pasajeros;
                            impuestos += (((precio_billeteIDA/1.21)-tasaIDA)*0.21)*pasajeros;
                            query = "UPDATE APP.VUELO SET VUELO.NUM_PASAJEROS = "+pasajerosExistentes+", VUELO.GANANCIA = " + ganancia + ", VUELO.TASAS_TOTALES_AEROPUERTOS = " + tasasAeropuertos 
                                    + ", VUELO.IMPUESTOS_TOTALES = " + impuestos + "WHERE VUELO.ID_VUELO = '"+id_vueloIDA+"'";
                            s.executeUpdate(query);
                            //REDIRECCION A LA SIGUIENTE PANTALLA
                            session.setAttribute("VISA", VISA);
                            response.sendRedirect("/PracticaFinal/VerCompra.jsp");
                        } else {
                            i = 1;
                            //Parametros generales para la insercion
                            String id_vueloIDA = session.getAttribute("id_vueloIDA").toString();
                            String id_vueloVUELTA = session.getAttribute("id_vueloVUELTA").toString();
                            String origen = session.getAttribute("origen").toString();
                            String destino = session.getAttribute("destino").toString();
                            Date fechaIDA = Date.valueOf(session.getAttribute("fechaIDA").toString());
                            Date fechaVUELTA = Date.valueOf(session.getAttribute("fechaVUELTA").toString());
                            String VISA = request.getParameter("NumeroVisa");
                            Double precio_billeteIDA = Double.valueOf(session.getAttribute("precio_billeteIDA").toString());
                            Double precio_billeteVUELTA = Double.valueOf(session.getAttribute("precio_billeteVUELTA").toString());
                            String dniComprador = session.getAttribute("DNI").toString();
                            
                            while (i<=pasajeros){
                                //Random ID
                                String idBilleteIDA;
                                Boolean idExists = true;
                                
                                //GENERACION DEL ID RANDOM UNICO
                                while (idExists) {
                                    Random random = new Random();
                                    char randomizedCharacter1 = (char) (random.nextInt(26) + 'a');
                                    char randomizedCharacter2 = (char) (random.nextInt(26) + 'a');
                                    int nrandom1 = random.nextInt(10);
                                    int nrandom2 = random.nextInt(10);
                                    int nrandom3 = random.nextInt(10);
                                    char dnileter = dniComprador.charAt(8);
                                
                                    idBilleteIDA = String.valueOf(randomizedCharacter1).toUpperCase()+String.valueOf(randomizedCharacter2).toUpperCase()+String.valueOf(nrandom1)+String.valueOf(nrandom2)+String.valueOf(nrandom3)+dnileter;
                                    
                                    //COMPROBACION DE QUE NO EXISTA EL ID RANDOM EN LA BD
                                    query = "SELECT BILLETES.ID FROM APP.BILLETES WHERE BILLETES.ID = '"+idBilleteIDA+"' FETCH FIRST 1 ROWS ONLY";
                                    rs = s.executeQuery(query);
                                    if (rs.next()){
                                        if (!idBilleteIDA.equals(rs.getString("ID"))) {
                                            idExists = false;
                                            session.setAttribute("IDBilleteIDA"+i, idBilleteIDA);
                                        }
                                    } else {
                                        idExists = false;
                                        session.setAttribute("IDBilleteIDA"+i, idBilleteIDA);
                                    }
                                }
                                
                                //PARAMETROS INDIVIDUALES
                                idBilleteIDA = session.getAttribute("IDBilleteIDA"+i).toString();
                                String nombre = request.getParameter("NombreBillete"+i);
                                String apellido = request.getParameter("ApellidosBillete"+i);
                                String dni = request.getParameter("DNIBillete"+i);
                                //INSERCION DE LOS DATOS EN LA BASE DE DATOS
                                System.out.println("FALLO EN LA QUERY DEL INSERT");
                                query = "INSERT INTO APP.BILLETES (ID, ID_VUELO, ORIGEN, DESTINO, FECHA, DNI, NOMBRE, APELLIDOS, NUMERO_VISA, PRECIO_BILLETE, DNI_COMPRADOR) "
                                        + "values('"+ idBilleteIDA +"','"+ id_vueloIDA +"','"+ origen +"','"+ destino +"','"+ fechaIDA +"','"+ dni +"','"+ nombre +"','"+ apellido +"','"+ VISA +"',"+ precio_billeteIDA +",'"+ dniComprador +"')";
                                s.executeUpdate(query);
                                
                                //GUARDADO DE DATOS INDIVIDUALES EN SESSION
                                session.setAttribute("IDBilleteIDA"+i, idBilleteIDA);
                                session.setAttribute("NombreBillete"+i, nombre);
                                session.setAttribute("ApellidosBillete"+i, apellido);
                                session.setAttribute("DNIBillete"+i, dni);
                                
                                i++;
                            }
                            i = 1;
                            //Parametros generales para la insercion
                            
                            while (i<=pasajeros){
                                //Random ID
                                String idBilleteVUELTA;
                                Boolean idExists = true;
                                
                                //GENERACION DEL ID RANDOM UNICO
                                while (idExists) {
                                    Random random = new Random();
                                    char randomizedCharacter1 = (char) (random.nextInt(26) + 'a');
                                    char randomizedCharacter2 = (char) (random.nextInt(26) + 'a');
                                    int nrandom1 = random.nextInt(10);
                                    int nrandom2 = random.nextInt(10);
                                    int nrandom3 = random.nextInt(10);
                                    char dnileter = dniComprador.charAt(8);
                                
                                    idBilleteVUELTA = String.valueOf(randomizedCharacter1).toUpperCase()+String.valueOf(randomizedCharacter2).toUpperCase()+String.valueOf(nrandom1)+String.valueOf(nrandom2)+String.valueOf(nrandom3)+dnileter;
                                    
                                    //COMPROBACION DE QUE NO EXISTA EL ID RANDOM EN LA BD
                                    query = "SELECT BILLETES.ID FROM APP.BILLETES WHERE BILLETES.ID = '"+idBilleteVUELTA+"' FETCH FIRST 1 ROWS ONLY";
                                    rs = s.executeQuery(query);
                                    if (rs.next()){
                                        if (!idBilleteVUELTA.equals(rs.getString("ID"))) {
                                            idExists = false;
                                            session.setAttribute("IDBilleteIDA"+i, idBilleteVUELTA);
                                        }
                                    } else {
                                        idExists = false;
                                        session.setAttribute("IDBilleteIDA"+i, idBilleteVUELTA);
                                    }
                                }
                                
                                //PARAMETROS INDIVIDUALES
                                idBilleteVUELTA = session.getAttribute("IDBilleteIDA"+i).toString();
                                String nombre = request.getParameter("NombreBillete"+i);
                                String apellido = request.getParameter("ApellidosBillete"+i);
                                String dni = request.getParameter("DNIBillete"+i);
                                //INSERCION DE LOS DATOS EN LA BASE DE DATOS
                                query = "INSERT INTO APP.BILLETES (ID, ID_VUELO, ORIGEN, DESTINO, FECHA, DNI, NOMBRE, APELLIDOS, NUMERO_VISA, PRECIO_BILLETE, DNI_COMPRADOR) "
                                        + "values('"+ idBilleteVUELTA +"','"+ id_vueloVUELTA +"','"+ origen +"','"+ destino +"','"+ fechaVUELTA +"','"+ dni +"','"+ nombre +"','"+ apellido +"','"+ VISA +"',"+ precio_billeteVUELTA +",'"+ dniComprador +"')";
                                s.executeUpdate(query);
                                
                                //GUARDADO DE DATOS INDIVIDUALES EN SESSION
                                session.setAttribute("IDBilleteVUELTA"+i, idBilleteVUELTA);
                                session.setAttribute("NombreBillete"+i, nombre);
                                session.setAttribute("ApellidosBillete"+i, apellido);
                                session.setAttribute("DNIBillete"+i, dni);
                                
                                i++;
                            }
                            
                            //RECUPERACION DE TASAS DE ORIGEN Y DESTINO
                            double tasaIDA = 0.0;
                            query = "SELECT ORIGEN.TASA FROM APP.ORIGEN WHERE ORIGEN.NOMBRE = '"+origen+"'";
                            
                            rs = s.executeQuery(query);
                            if (rs.next()){
                                tasaIDA=rs.getDouble("TASA")*pasajeros;
                            }
                            
                            double tasaVUELTA = 0.0;
                            query = "SELECT DESTINO.TASA FROM APP.DESTINO WHERE DESTINO.NOMBRE = '"+destino+"'";
                            
                            rs = s.executeQuery(query);
                            if (rs.next()){
                                tasaVUELTA=rs.getDouble("TASA")*pasajeros;
                            }
                            
                            //ACTUALIZACION DE TABLA USUARIOS
                            query = "SELECT USUARIOS.NUMERO_VIAJES FROM APP.USUARIOS WHERE USUARIOS.DNI = '"+session.getAttribute("DNI").toString()+"'";
                            rs = s.executeQuery(query);
                            int numeroViajes = 0;
                            if (rs.next()){
                                numeroViajes = rs.getInt("NUMERO_VIAJES");
                                numeroViajes++;
                            }
                            query = "UPDATE APP.USUARIOS SET USUARIOS.NUMERO_VIAJES = "+numeroViajes+" WHERE USUARIOS.DNI = '"+session.getAttribute("DNI").toString()+"'";
                            s.executeUpdate(query);
                            
                            //ACTUALIZACION DE TABLA VUELO
                            double tasasAeropuertos = 0.0;
                            int pasajerosExistentes = 0;
                            double ganancia = 0;
                            double impuestos = 0.0;
                            query = "SELECT VUELO.NUM_PASAJEROS, VUELO.GANANCIA, VUELO.TASAS_TOTALES_AEROPUERTOS, VUELO.IMPUESTOS_TOTALES FROM APP.VUELO WHERE VUELO.ID_VUELO = '"+id_vueloIDA+"'";
                            rs = s.executeQuery(query);
                            if (rs.next()){
                                tasasAeropuertos = rs.getDouble("TASAS_TOTALES_AEROPUERTOS");
                                pasajerosExistentes = rs.getInt("NUM_PASAJEROS");
                                ganancia = rs.getDouble("GANANCIA");
                                impuestos = rs.getDouble("IMPUESTOS_TOTALES");
                            }
                            tasasAeropuertos += (tasaIDA*pasajeros);
                            pasajerosExistentes += pasajeros;
                            ganancia += ((precio_billeteIDA/1.21)-tasaIDA)*pasajeros;
                            impuestos += (((precio_billeteIDA/1.21)-tasaIDA)*0.21)*pasajeros;
                            query = "UPDATE APP.VUELO SET VUELO.NUM_PASAJEROS = "+pasajerosExistentes+", VUELO.GANANCIA = " + ganancia + ", VUELO.TASAS_TOTALES_AEROPUERTOS = " + tasasAeropuertos 
                                    + ", VUELO.IMPUESTOS_TOTALES = " + impuestos + "WHERE VUELO.ID_VUELO = '"+id_vueloIDA+"'";
                            s.executeUpdate(query);
                            
                            //VUELTA
                            tasasAeropuertos = 0.0;
                            pasajerosExistentes = 0;
                            ganancia = 0;
                            impuestos = 0.0;
                            query = "SELECT VUELO.NUM_PASAJEROS, VUELO.GANANCIA, VUELO.TASAS_TOTALES_AEROPUERTOS, VUELO.IMPUESTOS_TOTALES FROM APP.VUELO WHERE VUELO.ID_VUELO = '"+id_vueloVUELTA+"'";
                            rs = s.executeQuery(query);
                            if (rs.next()){
                                tasasAeropuertos = rs.getDouble("TASAS_TOTALES_AEROPUERTOS");
                                pasajerosExistentes = rs.getInt("NUM_PASAJEROS");
                                ganancia = rs.getDouble("GANANCIA");
                                impuestos = rs.getDouble("IMPUESTOS_TOTALES");
                            }
                            tasasAeropuertos += (tasaIDA*pasajeros);
                            pasajerosExistentes += pasajeros;
                            ganancia += ((precio_billeteIDA/1.21)-tasaIDA)*pasajeros;
                            impuestos += (((precio_billeteIDA/1.21)-tasaIDA)*0.21)*pasajeros;
                            query = "UPDATE APP.VUELO SET VUELO.NUM_PASAJEROS = "+pasajerosExistentes+", VUELO.GANANCIA = " + ganancia + ", VUELO.TASAS_TOTALES_AEROPUERTOS = " + tasasAeropuertos 
                                    + ", VUELO.IMPUESTOS_TOTALES = " + impuestos + "WHERE VUELO.ID_VUELO = '"+id_vueloVUELTA+"'";
                            s.executeUpdate(query);
                            
                            //REDIRECCION A LA SIGUIENTE PANTALLA
                            session.setAttribute("VISA", VISA);
                            response.sendRedirect("/PracticaFinal/VerCompra.jsp");
                        }
                    }
                    %>
                </form>  
            </section>
        </section>
        <br/>
        
        <button class="myButton" onclick="location.href = './CompraBillete.jsp'">Volver</button>
    </body>
</html>
