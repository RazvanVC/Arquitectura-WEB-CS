<%-- 
    Document   : DetalleVuelos
    Created on : 15-ene-2022, 14:27:46
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css">
        <title>Detalle Vuelos</title>
    </head>
    <body>

        <header class="encabezado">
         <h1> <img src="./img/logo.png" alt="Logo" width="100" height="100"> </h1>
         <h2> DETALLE DE LOS VUELOS</h2>
        </header>
        <section class="seccion">
            <form action="">
                <h2> Puedes buscar los datos de un vuelo en especifico aquí abajo: </h2>
                        <label for="id_vuelo">Id_vuelo:</label>
                        <input type="text" name="id_vuelo" id="id_vuelo"/>
                        <input type="submit" value="Buscar"/>
                    </tr>
                </table>
            <form>
                <h2> Datos sobre el vuelo:</h2>
                <table>
                    <tr>
                    <td><label for="Id_Vuelo">Id_vuelo:</label></td>
                    <td><input type="text" nane="Id_vuelo" id="Id_vuelo"/></td>
                    </tr>
                    <tr>
                    <td><label for="Origen">Origen:</label></td>
                    <td><input type="text" nane="Origen" id="Origen"/></td>
                    </tr>
                    <tr>
                    <td><label for="Destino">Destino:</label></td>
                    <td><input type="text" nane="Destino" id="Destino"/></td>
                    </tr>
                    <tr>
                    <td><label for="Fecha"> :</label></td>
                    <td><input type="date" nane="Fecha" id="Fecha"/></td>
                    </tr>
                    <td><label for="Num_viajeros">Numero Viajeros:</label></td>  
                    <td><input type="text" name="Num_viajeros" id="Num_viajeros"/></td>
                    </tr>
                    <tr>
                    <td><label for="Ganancias">Ganancias</label></td>
                    <td><input type="text" name="Total_ganancias" id="Total_ganancias"/></td> 
                    </tr>
                    <tr>
                    <td><label for="Total_ganancias">Total Ganancias Empresa:</label></td>
                    <td><input type="text" name="Total_ganancias" id="Total_ganancias"/></td>   
                    <tr>
                </table>
            </form>
            <button class="myButton2" onclick="location.href = './AdminMainMenu.html'">Volver a la página de Administrador</button>
        </section>

    </body>
</html>
