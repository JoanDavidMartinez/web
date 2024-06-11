$(document).ready(function() {
    // Realizar una solicitud AJAX para obtener los datos de los tours

    $.ajax({
        url: 'getTour.php',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            // Construir la tabla con los datos recibidos
            var tableBody = '';
            data.forEach(function(tour) {
                if (tour.artistasInvitados != '') {
                    tour.artistasInvitados = "With " + tour.artistasInvitados;
                }

                var opcionesFecha = { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' };
                var fecha = new Date(tour.fecha);
                var fechaFormateada = fecha.toLocaleDateString('es-ES', opcionesFecha);

                fechaFormateada = fechaFormateada.charAt(0).toUpperCase() + fechaFormateada.slice(1);

                tableBody += '<tr class="row py-5" style="margin-top:30px">';
                tableBody += '<td class="col-md-4"><p style="color:#54d8a7" class="mb-0 font-weight-bolder">' + fechaFormateada + '</p><p>' + tour.artistasInvitados +'</p> </td>';
                tableBody += '<td class="col-md-4"><p style="color:#54d8a7" class="mb-0 font-weight-bolder">' + tour.ubicacion + '</p><p>' + tour.escenario +'</p></td>';
                tableBody += '<td class="col-md-4 text-center d-flex align-items-center justify-content-center"> <a href="' + tour.urlT + '"><button type="button" style="border-color:#54d8a7;color:white;background-color:black">¡Tickets!</button></a></td>';
                tableBody += '</tr>';
            });
            $('.table tbody').html(tableBody);
        },
        error: function() {
            $('#resultado').html('Hubo un error al obtener los datos.');
        }
    });
});