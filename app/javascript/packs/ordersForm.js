import flatpickr from "flatpickr";

$(document).ready(function() {
  $('#delivery').on('click', () => {
    $('#homeDelivery')[0].checked = false;
    $('#shop').removeClass('hovered');
    $('#delivery').addClass('hovered');
  })

  $('#shop').on('click', () => {
    $('#homeDelivery')[0].checked = true;
    $('#delivery').removeClass('hovered');
    $('#shop').addClass('hovered');
  })

  $('#deliveryDate').flatpickr({
    minDate: 'today'
  });
});