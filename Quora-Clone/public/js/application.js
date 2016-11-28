$(document).ready(function() {
//==============================================================================
//Ocultar las formas
//==============================================================================
  $('#frm_i').hide();
  $('#frm_r').hide();
//==============================================================================
//Botones
//==============================================================================
  $('#btn_r').click(function(event) {
    event.preventDefault();
    $('#frm_i').hide();
    $('#frm_r').toggle();
  });
//==============================================================================
  $('#btn_i').click(function(event) {
    event.preventDefault();
    $('#frm_r').hide();
    $('#frm_i').toggle();
  });
//==============================================================================
  $('body').on('click','#btn_reg',function(event) {
    event.preventDefault();
    var cadena = $(this).parent().parent().parent().serialize();
    $.post('/user/reg',cadena,function(data)
    {       
      $("#principal").html(data);
    });
  });
//==============================================================================  
  $('body').on('click','#btn_ini',function(event) {
    event.preventDefault();
    var cadena = $(this).parent().parent().parent().serialize();
    $.post('/user/ini',cadena,function(data)
    {       
      $("#principal").html(data);
    });
  });
//============================================================================== 
  $('body').on('click','#btn_mod',function(event) {
    event.preventDefault();
    var cadena = $('#frm_mod').serialize();
    $.post('/user/mod',cadena,function(data)
    {       
      $("#principal").html(data);
    });
  });
//==============================================================================
  $('#btn_make_q').click(function(event) {
    event.preventDefault();
    var question = $("#title_q").val();
    console.log(question);
    if (question != "") {
      $('#modal_title_q').html('<button type="button" class="close" data-dismiss="modal">&times;</button>');
      $('#modal_title_q').append("<input id='t_q'type='text' class='modal-title' name='title' >")
      $('#t_q').val(question);
    };
  });
//==============================================================================
  $('body').on('click','#btn_send_q',function(event) {
    event.preventDefault();
    var cadena = $('#frm_send_q').serialize();
    console.log(cadena);
    $.post('/make/question',cadena,function(data)
    {       
       if (data) {
        $("#title_q").val('');
        $("#b_q").val('');
        $("#t_q").val('');
        alert('Your question was post successfully')
       }else{
        alert("We are sorry, but your question wasn't post successfully")
       };
    });
  });
//============================================================================== 

});

