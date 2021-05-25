require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


$( document ).ready(function() {
  
  $('#substract').on('click', () => {
    $('#quantity')[0].value --
    const total = parseInt($('#quantity')[0].value) * parseInt($('#servicePrice')[0].innerText.split(' ').pop())
    $('#total')[0].innerText = ''
    $('#total')[0].insertAdjacentText('beforeend', `$ ${total}`)
  })

  $('#add').on('click', () => {
    $('#quantity')[0].value ++
    const total = parseInt($('#quantity')[0].value) * parseInt($('#servicePrice')[0].innerText.split(' ').pop())
    $('#total')[0].innerText = ''
    $('#total')[0].insertAdjacentText('beforeend', `$ ${total}`)
  })

  $('#quantity').change(() => {
    const total = parseInt($('#quantity')[0].value) * parseInt($('#servicePrice')[0].innerText.split(' ').pop())
    $('#total')[0].innerText = ''
    $('#total')[0].insertAdjacentText('beforeend', `$ ${total}`)
  })
});

