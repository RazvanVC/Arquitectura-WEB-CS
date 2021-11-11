var total = 0;
var total1 = 0;
var total2 = 0;
var total3 = 0;
var total4 = 0;
var total5 = 0;

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

function annadir(label, value) {
    select = document.getElementById(listaPorMesa());
    total = totalPorMesa(value);
    var html = "<option >" + label + "</option>";
    var opt = document.createElement('option');
    opt.innerHTML = html;
    select.appendChild(opt);
    document.getElementById("total").value = total;
}

function annadirCheck(label, value, checked) {
    select = document.getElementById(listaPorMesa());
    if (checked) {
        total = totalPorMesa(value);
        var html = "<option >" + label + "</option>";
        var opt = document.createElement('option');
        opt.innerHTML = html;
        select.appendChild(opt);
    } else {
        total = totalPorMesa(-value);
        for (var i = 0; i < select.length; i++) {
            if (select.options[i].label == label) select.remove(i);
        }
    }
    document.getElementById("total").value = total;
}

function listaPorMesa() {
    let combobox = document.getElementById('combobox')
    let mesa = combobox.options[combobox.selectedIndex].value;
    switch (mesa) {
        case "1":
            return 'innerListaPlatos1'
        case "2":
            return 'innerListaPlatos2'
        case "3":
            return 'innerListaPlatos3'
        case "4":
            return 'innerListaPlatos4'
        case "5":
            return 'innerListaPlatos5'
    }
}

function swapMesa() {
    let combobox = document.getElementById('combobox')
    let mesa = combobox.options[combobox.selectedIndex].value;
    $("#listaPlatos1").hide();
    $("#listaPlatos2").hide();
    $("#listaPlatos3").hide();
    $("#listaPlatos4").hide();
    $("#listaPlatos5").hide();
    switch (mesa) {
        case "1":
            document.getElementById("total").value = total1;
            $("#listaPlatos1").show();
            break;
        case "2":
            document.getElementById("total").value = total2;
            $("#listaPlatos2").show();
            break;
        case "3":
            document.getElementById("total").value = total3;
            $("#listaPlatos3").show();
            break;
        case "4":
            document.getElementById("total").value = total4;
            $("#listaPlatos4").show();
            break;
        case "5":
            document.getElementById("total").value = total5;
            $("#listaPlatos5").show();
            break;
    }

}

function totalPorMesa(total) {
    switch (listaPorMesa()) {
        case "innerListaPlatos1":
            total1 = total1 + parseInt(total);
            return total1;
        case "innerListaPlatos2":
            total2 = total2 + parseInt(total);
            return total2;
        case "innerListaPlatos3":
            total3 = total3 + parseInt(total);
            return total3;
        case "innerListaPlatos4":
            total4 = total4 + parseInt(total);
            return total4;
        case "innerListaPlatos5":
            total5 = total5 + parseInt(total);
            return total5;
    }
}

function pagar(){
    switch (listaPorMesa()) {
        case "innerListaPlatos1":
            total1 = 0;
            break;
        case "innerListaPlatos2":
            total2 = 0;
            break;
        case "innerListaPlatos3":
            total3 = 0;
            break;
        case "innerListaPlatos4":
            total4 = 0;
            break;
        case "innerListaPlatos5":
            total5 = 0;
            break;
    }
    document.getElementById("total").value = 0;
    select = document.getElementById(listaPorMesa());
    select.innerHTML = "";
}


