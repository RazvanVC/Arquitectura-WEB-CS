function showFields() {
    if (document.querySelector('input[name="tipo"]:checked').value === "ida+vuelta") $("#formVuelta").show();
    else $("#formVuelta").hide();
    console.log(document.querySelector('input[name="tipo"]:checked').value);
}