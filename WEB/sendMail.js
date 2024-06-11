$(document).ready(function() {
    $("#mail2db").submit(function(event) {
        // Evitar que el formulario se envíe de forma tradicional
        event.preventDefault();

        // Recoger los datos del formulario
        var formData = new FormData(this);

        // Enviar los datos mediante AJAX
        $.ajax({
            type: "POST",
            url: "sendMail.php",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            encode: true,
            success: function(data) {
                // Mostrar el resultado en el div #resultado
                $("#resultadoE").html(data.message);
                $("#resultadoE").css("color", "green");
            },
            error: function() {
                $("#resultadoE").html("Hubo un error en el envío de datos.");
                $("#resultadoE").css("color", "reds");
            }
        });
    });
});