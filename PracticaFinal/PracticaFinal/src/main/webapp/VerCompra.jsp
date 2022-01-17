<%-- 
    Document   : VerCompra
    Created on : 14-ene-2022, 19:22:37
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css">
        <title>Ver Compra</title>
    </head>
    <body>
        <header class="encabezado">
            <h1> <img src="./img/logo.png"  alt="Logo" width="300" height="300"> </h1>
            <h2>Ver Compra Realizada</h2>
        </header>
        <!-- Se repite la seccion entera -->
        <%
            int i = 1;
            int pasajeros = Integer.valueOf(session.getAttribute("pasajeros").toString());
            String tipo = session.getAttribute("tipo").toString();
            while (i <= pasajeros){
                if(tipo.equals("ida")){
        %>
            <section class="seccion2">
                <div>
                    <h2>Billete IDA</h2>
                    <table>
                        <tr>
                            <td>Id: <%= String.valueOf(session.getAttribute("IDBilleteIDA"+i)) %></td>
                            <td> Origen: <%= String.valueOf(session.getAttribute("origen")) %></td>
                        </tr>
                        <tr>
                            <td>Id Vuelo: <%= String.valueOf(session.getAttribute("id_vueloIDA")) %></td>
                            <td>Destino: <%= String.valueOf(session.getAttribute("destino")) %></td>
                        </tr>
                        <tr>
                            <td>Fecha Salida: <%= String.valueOf(session.getAttribute("fechaIDA")) %></td>
                        </tr>
                        <tr>
                            <td>Nombre y Apellidos: <%= String.valueOf(session.getAttribute("NombreBillete"+i))+" "+ String.valueOf(session.getAttribute("ApellidosBillete"+i)) %></td>
                        </tr>
                        <tr>
                            <td>DNI: <%= String.valueOf(session.getAttribute("DNIBillete"+i)) %></td>
                        </tr>
                        <tr>
                            <td>VISA: <%= String.valueOf(session.getAttribute("VISA")) %></td>
                            <td>Precio: <%= String.valueOf(session.getAttribute("precio_billeteIDA")) %></td>
                        </tr>
                    </table>
                </div>
            </section>        
        <%            
                } else {
        %>
            <section class="seccion2">
                <div>
                    <h2>Billete IDA</h2>
                    <table>
                        <tr>
                            <td>Id: <%= String.valueOf(session.getAttribute("IDBilleteIDA"+i)) %></td>
                            <td> Origen: <%= String.valueOf(session.getAttribute("origen")) %></td>
                        </tr>
                        <tr>
                            <td>Id Vuelo: <%= String.valueOf(session.getAttribute("id_vueloIDA")) %></td>
                            <td>Destino: <%= String.valueOf(session.getAttribute("destino")) %></td>
                        </tr>
                        <tr>
                            <td>Fecha Salida: <%= String.valueOf(session.getAttribute("fechaIDA")) %></td>
                        </tr>
                        <tr>
                            <td>Nombre y Apellidos: <%= String.valueOf(session.getAttribute("NombreBillete"+i))+" "+ String.valueOf(session.getAttribute("ApellidosBillete"+i)) %></td>
                        </tr>
                        <tr>
                            <td>DNI: <%= String.valueOf(session.getAttribute("DNIBillete"+i)) %></td>
                        </tr>
                        <tr>
                            <td>VISA: <%= String.valueOf(session.getAttribute("VISA")) %></td>
                            <td>Precio: <%= String.valueOf(session.getAttribute("precio_billeteIDA")) %></td>
                        </tr>
                    </table>
                </div>
            </section>
            <section class="seccion2">
                <div>
                    <h2>Billete VUELTA</h2>
                    <table>
                        <tr>
                            <td>Id: <%= String.valueOf(session.getAttribute("IDBilleteVUELTA"+i)) %></td>
                            <td> Origen: <%= String.valueOf(session.getAttribute("destino")) %></td>
                        </tr>
                        <tr>
                            <td>Id Vuelo: <%= String.valueOf(session.getAttribute("id_vueloVUELTA")) %></td>
                            <td>Destino: <%= String.valueOf(session.getAttribute("origen")) %></td>
                        </tr>
                        <tr>
                            <td>Fecha Salida: <%= String.valueOf(session.getAttribute("fechaVUELTA")) %></td>
                        </tr>
                        <tr>
                            <td>Nombre y Apellidos: <%= String.valueOf(session.getAttribute("NombreBillete"+i))+" "+ String.valueOf(session.getAttribute("ApellidosBillete"+i)) %></td>
                        </tr>
                        <tr>
                            <td>DNI: <%= String.valueOf(session.getAttribute("DNIBillete"+i)) %></td>
                        </tr>
                        <tr>
                            <td>VISA: <%= String.valueOf(session.getAttribute("VISA")) %></td>
                            <td>Precio: <%= String.valueOf(session.getAttribute("precio_billeteVUELTA")) %></td>
                        </tr>
                    </table>
                </div>
            </section>
        <%
                }
                i++;
            }
        %>
        
        
        <br/>
        <br/>
        <button class="myButton" onclick="location.href = './UserMainMenu.jsp'">Continuar</button>
    </body>
</html>
