$(document).on('turbolinks:load', function() {
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    autoclose: true
  });
});

