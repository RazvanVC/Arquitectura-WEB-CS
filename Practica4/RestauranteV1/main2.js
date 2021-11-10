$(document).ready(function(){
    //Add button click handler
    $('#btn-add').click(function(){
        //Get the value from the table
        $('#listaPlatos').append('<li>' + $('#plato').val() + '</li>');
        $('#listaPlatos').append('<li>Hola</li>');
        
    });

});