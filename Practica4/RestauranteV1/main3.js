function swapPlatos(nombre) {
    switch (nombre) {
        case "Primeros":
            $("#form2").show();
            $("#form3").hide();
            $("#form4").hide();
            break;
        case "Segundos":
            $("#form2").hide();
            $("#form3").show();
            $("#form4").hide();
            break;
        case "Postres":
            $("#form2").hide();
            $("#form3").hide();
            $("#form4").show();
            break;
    }
}
$(document).ready(function () {
    document.getElementById("precio").value = totalPorMesa(0);
    var total1 = 0;
    var total2 = 0;
    var total3 = 0;
    var total4 = 0;
    var total5 = 0;
    var total = 0;

    document.getElementById("#form2").show();

    
    $('select').on('change', (event) => {

        let combobox = document.getElementById('combobox')
        let Mesa = combobox.value;
        $("#listaPlatos1").hide();
        $("#listaPlatos2").hide();
        $("#listaPlatos3").hide();
        $("#listaPlatos4").hide();
        $("#listaPlatos5").hide();
        var listaSeleccionada = "#listaPlatos1" + Mesa

        switch (Mesa) {
            case "1":
                total = total1;
                $("#listaPlatos1").show()
                break
            case "2":
                total = total2;
                $("#listaPlatos2").show()
                break
            case "3":
                total = total3;
                $("#listaPlatos3").show()
                break
            case "4":
                total = total4;
                $("#listaPlatos4").show()
                break
            case "5":
                total = total5;
                $("#listaPlatos5").show()
                break


        }
        $(listaSeleccionada).show();
        document.getElementById("precio").value = total;

    });
    function totalPorMesa(total) {
        if (listaPorMesa() == '#listaPlatos1') {
            return total1 += total;
        } else if (listaPorMesa() == '#listaPlatos2') {
            return total2 += total;
        } else if (listaPorMesa() == '#listaPlatos3') {
            return total3 += total;
        } else if (listaPorMesa() == '#listaPlatos4') {
            return total4 += total;
        } else if (listaPorMesa() == '#listaPlatos5') {
            return total5 += total;
        }

    }
    function VacioMesa(total) {
        if (listaPorMesa() == '#listaPlatos1') {
            return total1 = 0;
        } else if (listaPorMesa() == '#listaPlatos2') {
            return total2 = 0;
        } else if (listaPorMesa() == '#listaPlatos3') {
            return total3 = 0;
        } else if (listaPorMesa() == '#listaPlatos4') {
            return total4 = 0;
        } else if (listaPorMesa() == '#listaPlatos5') {
            return total5 = 0;
        }

    }
    //Add button click handler
    function listaPorMesa() {
        let combobox = document.getElementById('combobox')
        let Mesa = combobox.value;
        if (Mesa == "1") {

            return '#listaPlatos1'
        } else if (Mesa == "2") {

            return '#listaPlatos2'
        } else if (Mesa == "3") {

            return '#listaPlatos3'
        } else if (Mesa == "4") {

            return '#listaPlatos4'
        } else if (Mesa == "5") {

            return '#listaPlatos5'
        }
    }
    $("#radio-1").click(function () {
        $(".p1").show();
        $(".p2").hide();
        $(".p3").hide();

    })
    $("#radio-2").click(function () {
        $(".p1").hide();
        $(".p2").show();
        $(".p3").hide();

    })
    $("#radio-3").click(function () {
        $(".p1").hide();
        $(".p2").hide();
        $(".p3").show();
    })
    $("#conCafe").click(function () {
        document.getElementById("precio").value = totalPorMesa(1);
    })
    $("#conCopa").click(function () {
        document.getElementById("precio").value = totalPorMesa(2);
    })

    $("#pagado").click(function () {
        VacioMesa();
        $(listaPorMesa()).html('<li></li>')
        document.getElementById("precio").value = total;
    })
    $('#btn-add1').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>pollo a la brasa</li>');
        document.getElementById("precio").value = totalPorMesa(8);

    });
    $('#btn-add2').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>ensalada de frutas</li>');
        document.getElementById("precio").value = totalPorMesa(7);

    });
    $('#btn-add3').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>ensalada de verduras</li>');
        document.getElementById("precio").value = totalPorMesa(6);

    });
    $('#btn-add4').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>pescado con patatas</li>');
        document.getElementById("precio").value = totalPorMesa(9);

    });
    $('#btn-add5').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>espaguettis a la boloñesa</li>');
        document.getElementById("precio").value = totalPorMesa(7);

    });



    $('#btn-add6').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>solomillo</li>');
        document.getElementById("precio").value = totalPorMesa(12);


    });
    $('#btn-add7').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>albondigas</li>');
        document.getElementById("precio").value = totalPorMesa(9);


    });
    $('#btn-add8').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>dorada con patatas</li>');
        document.getElementById("precio").value = totalPorMesa(11);


    });
    $('#btn-add9').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>croquetas</li>');
        document.getElementById("precio").value = totalPorMesa(10);

    });
    $('#btn-add10').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>mejillones</li>');
        document.getElementById("precio").value = totalPorMesa(8);

    });



    $('#btn-add11').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>arroz con leche</li>');
        document.getElementById("precio").value = totalPorMesa(2);


    });
    $('#btn-add12').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>fruta</li>');
        document.getElementById("precio").value = totalPorMesa(1);


    });
    $('#btn-add13').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>tiramisu</li>');
        document.getElementById("precio").value = totalPorMesa(3);


    });
    $('#btn-add14').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>flan de huevo</li>');
        document.getElementById("precio").value = totalPorMesa(2);

    });
    $('#btn-add15').click(function () {
        //Get the value from the table
        $(listaPorMesa()).append('<li>bizcocho de limon</li>');
        document.getElementById("precio").value = totalPorMesa(2);

    });

});


