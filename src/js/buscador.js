document.addEventListener('DOMContentLoaded', function() {
    iniciarApp();
});

function iniciarApp() {
    buscarPorFecha();
}

function buscarPorFecha() {
    const fechaInput = document.querySelector('#fecha');
    fechaInput.addEventListener('input', function(e) { //es decir, cada que seleccione una fecha
        const fechaSeleccionada = e.target.value;

        window.location = `?fecha=${fechaSeleccionada}`; //templade string
        //redirecciona al usuario por QueryString la fecha seleccionada
    });
}