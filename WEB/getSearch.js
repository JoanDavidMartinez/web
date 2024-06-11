$(document).ready(function(){

    function realizarBusqueda(busqueda=''){
        $.ajax({
            url: 'getSearch.php?busqueda=' + busqueda,
            type: 'get',
            success: function(response){
                $('#resultado').html(response);

                $('.cancion-card').on('click', function() {
                    var cancionId = $(this).data('id');
                    mostrarPopup(cancionId);
                });
            }
        });
    }

    function mostrarPopup(cancionId) {
        $.ajax({
            url: 'getAlbum.php',
            type: 'GET',
            data: { cancionId: cancionId },
            success: function(response) {
                $('#popupContent').html(response);
                $('#popupModal').modal('show');
            }
        });
    }

    realizarBusqueda('');

    $('#busqueda').submit(function(event){
        event.preventDefault(); // Evitar que el formulario se envíe normalmente
        var busqueda = $('#busqueda Input').val();
        realizarBusqueda(busqueda);
    });
});