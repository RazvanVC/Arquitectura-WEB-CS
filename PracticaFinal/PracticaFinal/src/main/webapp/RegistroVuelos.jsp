<%-- 
    Document   : RegistroVuelos
    Created on : 15-ene-2022, 14:27:16
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css">
        <title>Registro Vuelos</title>
    </head>
    <body>
        <header class="encabezado">
            <h1> <img src="./img/logo.png"  alt="Logo" width="300" height="300"> </h1>
            <h2>Registro de los vuelos</h2>
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
                <h2> Datos sobre toda la aerolinea:</h2>
                <table>
                    <tr>
                    <td><label for="Num_viajeros_medio">Numero Viajeros Medio:</label></td>  
                    <td><input type="text" name="Num_viajeros_medio" id="Num_viajeros_medio"/></td>
                    <!--Bucle en cada iteración:
                        X= 0;
                        X= X+ Query(NumViajerosBuelo/NumAsientos)
                        Sale bucle
                        X/NumIteraciones-->
                    </tr>
                    <tr>
                    <td><label for="Total_ganancias_medio">Total Ganancias por vuelo Medio:</label></td>
                    <td><input type="text" name="Total_ganancias_medio" id="Total_ganancias_medio"/></td> 
                    <!--Bucle en cada iteración:
                        X= 0;
                        X= X+ Query(Ganancias)
                        Sale bucle
                        X/NumIteraciones-->
                    </tr>
                    <tr>
                    <td><label for="Total_ganancias">Total Ganancias Empresa:</label></td>
                    <td><input type="text" name="Total_ganancias" id="Total_ganancias"/></td>
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
