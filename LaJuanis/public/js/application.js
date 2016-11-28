$(document).ready(function() {
  $('#tablausuarios').hide();
//==============================================================
$('body').on('submit','#infopedido',function(event){
    event.preventDefault();
    var cadena = $(this).serialize();
    $.post('/pedidos',cadena,function(data){
      $('#containerpedido').html(data);
    });
  });
//==============================================================
$('body').on('click','#pedidosbtn',function(event){
      $('#tablausuarios').hide();
      $('#tablaspedidos').slideToggle();
  });
//==============================================================
$('body').on('click','#usuariosbtn',function(event){
      $('#tablaspedidos').hide();
      $('#tablausuarios').slideToggle();
  });
//==============================================================
});
