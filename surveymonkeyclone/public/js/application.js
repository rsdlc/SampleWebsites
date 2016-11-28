$(document).ready(function() {
//==============================================================================
//Ocultar las formas
//==========================================================
	$('#registerform').hide();
  $('#loginform').hide();
  make_principal();
  var final_resp = {title: "",questions: [],options: []}
  var title = "";
  var question = "";
  var options = [];
  var count = 0;
  var active_panel = 0;
//==============================================================================
//Botones de inicio y registro
//==============================================================================
  $('#registerbutton').click(function(event) {
    event.preventDefault();
    $('#loginform').hide();
    $('#registerform').slideToggle();
  });
//==============================================================================
  $('#loginbutton').click(function(event) {
    event.preventDefault();
    $('#registerform').hide();
    $('#loginform').slideToggle();
  });
//==============================================================================
  $('body').on('click','#confirmregbutton',function(event) {
    event.preventDefault();
    var cadena = $(this).parent().parent().parent().serialize();
    $.post('/user/reg',cadena,function(data)
    {  
      $("#principal").html(data);
      make_principal();
    });
  });
//==============================================================================  
  $('body').on('click','#confirmloginbutton',function(event) {
    event.preventDefault();
    var cadena = $(this).parent().parent().parent().serialize();
    $.post('/user/ini',cadena,function(data)
    { 
      $("#principal").html(data);
      make_principal();
    });
  });
//==============================================================================  
//Make the survey
//==============================================================================  
  $('body').on('click','#btn_title',function(event) {
    event.preventDefault();
      title = $('#comment').val();
      final_resp.title = title;
      active_panel = 1;
      make_survey_title();
      make_survey_panel();
      make_panel_question_elements();
      $('#authoredsurveys').slideUp();
      $('#takensurveys').slideUp();
  });
  //==============================================================================  
  $('body').on('click','#btn_cancel',function(event) {
    event.preventDefault();
    rest();
    make_principal();
    $('#authoredsurveys').slideDown();
      $('#takensurveys').slideDown();
  });
//==============================================================================  
  $('body').on('click','#btn_question',function(event) {
      event.preventDefault();
      question = ($('#comment').val());
      make_question(question);
    });
//==============================================================================  
  $('body').on('click','#btn_option',function(event) {
      event.preventDefault();
      options.push($('#comment').val());
      options.push($('#comment').val());
      $('#comment').val("");
      make_option(options.pop());
    });
//==============================================================================  
  $('body').on('click','#btn_end_question',function(event) {
      event.preventDefault();
      if (count < 3) {
        alert("You need 3 options!")
      }else{
        make_question_definitive();
      }
  });
  //==============================================================================  
  $('body').on('click','#btn_finish',function(event) {
      event.preventDefault();
      if (final_resp.questions.length < 1) {
        alert("You need at least 1 question!")
      }else{
        var cadena = final_resp;
        console.log(cadena);
        $.post('/make/survey/',cadena,function(data)
      {       
        alert(data)
        
       });
        location.reload();
      }
      
  });

//==============================================================================  
  function make_survey_title() {
    $('#survey_panel').html('<button type="button" id="btn_cancel" class="btn pull-right btn-danger btn-sm">Cancel</button>');
    $('#survey_panel').append("<h2 class='text-center'>" + title + "</h2>");
    $('#survey_panel').append("<div id='the_div'></div>")
    $('#survey_panel').append('<button type="button" id="btn_finish" class="btn pull-right btn-success btn-sm">Summit Survey</button>');
  };
//==============================================================================   
  function make_survey_panel() {
    $('#the_div').append('<div class="panel panel-default" id="panel_'+active_panel+'"></div>');
  };
//============================================================================== 
  function make_question_definitive() {
    $('#panel_'+active_panel+'').html('<h3> '+question+ '</h3>');
    $('#panel_'+active_panel+'').append('<p>1. '+options[0]+'</p>');
    $('#panel_'+active_panel+'').append('<p>2. '+options[1]+'</p>');
    $('#panel_'+active_panel+'').append('<p>3. '+options[2]+'</p>');
    final_resp.questions.push(question);
    final_resp.options.push(options);
    options = [];
    count = 0;
    active_panel = active_panel + 1;
    make_survey_panel();
    make_panel_question_elements();
  }
//============================================================================== 
  function make_panel_question_elements() {
    $('#panel_'+active_panel+'').html('<label for="comment">Question:</label>');
    $('#panel_'+active_panel+'').append("<textarea class='form-control' rows='2' id='comment' placeholder='Question...'></textarea>");
    $('#panel_'+active_panel+'').append("<button type='button' class='btn btn-default btn-sm' id='btn_question'><span class='glyphicon glyphicon-ok'></span> Commit question</button>");
  };
//==============================================================================   
  function make_question(question) {
    $('#panel_'+active_panel+'').html('<h3> '+question+ '</h3>');
    $('#panel_'+active_panel+'').append("<div id='div_option_"+active_panel+"'></div>");
    $('#panel_'+active_panel+'').append("<textarea class='form-control' rows='2' id='comment' placeholder='Option...'></textarea>");
    $('#panel_'+active_panel+'').append("<button type='button' class='btn btn-default btn-sm' id='btn_option'><span class='glyphicon glyphicon-ok'></span> Commit option</button>");
    $('#panel_'+active_panel+'').append('<button type="button" class="btn pull-right btn-sm" id="btn_end_question"><span class="glyphicon glyphicon-send"></span> End question </button>');
  }
//============================================================================== 
  function make_option(option) {
    count = count + 1;
    if (count<4) {
      $('#div_option_'+active_panel+'').append('<p>'+count+'. '+option+'</p>');
    };
  }
//============================================================================== 
  function rest() {
  final_resp = {title: "",questions: [],options: []}
  title = "";
  question = "";
  options = [];
  count = 0;
  active_panel = 0;
  }
//==============================================================================  
  function make_principal() {
    $('#survey_panel').html('<h2>Create your survey</h2>');
    $('#survey_panel').append('<p>Type the title and start creating it.</p>');
    $('#survey_panel').append('<label for="comment">Title:</label>');
    $('#survey_panel').append('<textarea class="form-control" rows="2" id="comment"  placeholder="Title of survey..."></textarea>');
    $('#survey_panel').append("<button type='button' class='btn btn-default btn-sm' id='btn_title'><span class='glyphicon glyphicon-send'></span>Create Survey</button");
  };


  

});

// //Make the survey
// //==============================================================================  
//   $('body').on('click','#btn_title',function(event) {
//       event.preventDefault();
//       var cadena = $(this).parent().parent().serialize();
//       console.log(cadena);
//        $.post('/make/survey/title',cadena,function(data)
//       {       
//         $("#survey_panel").html(data);
//        });
//     });
// //==============================================================================  
//   $('body').on('click','#btn_question',function(event) {
//       event.preventDefault();
//       var cadena = $(this).parent().parent().serialize();
//       console.log(cadena);
//        $.post('/make/survey/question',cadena,function(data)
//       {       
//         $("#survey_panel").html(data);
//        });
//     });
// //==============================================================================  
//   $('body').on('click','#btn_option',function(event) {
//       event.preventDefault();
//       var cadena = $(this).parent().parent().serialize();
//       console.log(cadena);
//        $.post('/make/survey/option',cadena,function(data)
//       {       
//         $("#survey_panel").html(data);
//        });
//     });
// //==============================================================================  