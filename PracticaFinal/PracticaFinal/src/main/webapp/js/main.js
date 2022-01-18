function showFieldsTipoVuelo() {
    if (document.querySelector('input[name="tipo"]:checked').value === "ruta") {
        $("#Temporalidad").show();
        $("#lblTemporalidad").show();
        $("#lblFechaFinal").show();
        $("#FechaFinal").show();
        $("#lblFechaInicioT").show();
        $("#lblFechaInicioV").hide();
    }
    else {
        $("#Temporalidad").hide();
        $("#lblTemporalidad").hide();
        $("#lblFechaFinal").hide();
        $("#FechaFinal").hide();
        $("#lblFechaInicioT").hide();
        $("#lblFechaInicioV").show();
    }
}

function showFieldsPrecio () {
    if (document.querySelector('input[name="precio"]:checked').value === "precio_customizado") {
        $("#PrecioBillete").show();
        $("#lblPrecio").show();
    }
    else {
        $("#PrecioBillete").hide();
        $("#lblPrecio").hide();
    }
}