

function swapRutaVuelo(nombre) {
    switch (nombre) {
        case "Ruta del Vuelo":
            $("#FechaOrigen").show();
            $("#FechaDestino").show();
            $("#FechaInicio").show();
            $("#FechaFinal").show();
            $("#Temporalidad").show();
            break;
        case "Destino del Vuelo":
            $("#FechaOrigen").show();
            $("#FechaDestino").show();
            $("#FechaInicio").show();
            $("#FechaFinal").hide();
            $("#Temporalidad").hide();
            break;
        case "Precio Recomendado":
            $("#PrecioBillete").hide();
            break;
        case "Precio Customizado":
            $("#PrecioBillete").show();
        break;
    }
}