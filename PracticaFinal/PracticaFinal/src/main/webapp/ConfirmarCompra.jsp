<%-- 
    Document   : ConfirmarCompra
    Created on : 14-ene-2022, 17:38:20
    Author     : PC
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
                        <% int i = 1;
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
                        <input type="submit" value=" Comprar " />
                    </fieldset>
                    <%
                    
                    %>
                </form>  
            </section>
        </section>
        <br/>
        
        <button class="myButton" onclick="location.href = './CompraBilletes.jsp'">Volver</button>
    </body>
</html>
