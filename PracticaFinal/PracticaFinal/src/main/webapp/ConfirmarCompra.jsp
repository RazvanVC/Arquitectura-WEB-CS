<%-- 
    Document   : ConfirmarCompra
    Created on : 14-ene-2022, 17:38:20
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Copnfirmar Compra</title>
    </head>
    <body>
        <h1>Confirmar Compra de Billete</h1>
        <!-- Aqui va la imagen del logo -->
        <section>
            <h3>Rellene su(s) billete(s)</h3>
            <form action="<%=request.getContextPath()%>/Login" method="post">
                <fieldset>
                    <!---Todo esto se genera de forma dinámica dependiendo del número de usuarios--->
                    <div>
                        <legend>Billetes</legend>
                        <label for="Nombre">Nombre:</label>
                        <input type="text" name="NombreBillete" id="NombreBillete" required="required" />
                        <label for="Apellidos">Apellidos:</label>
                        <input type="text" name="ApellidosBillete" id="ApellidosBillete" required="required" />
                        <label for="DNI"> DNI:</label>
                        <input type="text" name="DNIBillete" id="DNIBillete" required="DNI" />
                    </div>
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
                    <input type="submit" value="Comprar" />
                </fieldset>
            </form>  
        </section>
        <button class="myButton" onclick="location.href = './CompraBilletes.jsp'">Volver</button>
    </body>
</html>