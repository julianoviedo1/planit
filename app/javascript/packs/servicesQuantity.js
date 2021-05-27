$(document).ready(function() {
  console.log('hola');
  function totalPrice() {
    const total = parseInt($('#quantity')[0].value) * parseInt($('#servicePrice')[0].innerText.split(' ').pop());
    $('#total')[0].innerText = '';
    $('#total')[0].insertAdjacentText('beforeend', `$ ${total}`);
  }

  $('#substract').on('click', () => {
    $('#quantity')[0].value --;
    totalPrice();
  })

  $('#add').on('click', () => {
    $('#quantity')[0].value ++;
    totalPrice();
  })

  $('#quantity').change(() => {
    totalPrice();
  })
});