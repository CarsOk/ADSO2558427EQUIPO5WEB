$(document).ready(function() {
    // Mostrar ventana emergente en caso de alerta
    if ($('.alert').text().trim().length) {
      alert($('.alert').text().trim());
    }
  });
  