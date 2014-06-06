jQuery(document).ready(function($) {
  var _ctnDown = setInterval(function(){ShowTimes();},1000);
  function ShowTimes() {
    var now = new Date();
    var hrs = 23-now.getHours();
    var mins = 59-now.getMinutes();
    var secs = 59-now.getSeconds();
    var str = '';
    str +=  '<span class="countdown_row countdown_show">';
    str +=  '<span class="countdown_section hrs">';
    str +=  '<span class="countdown_amount">' + hrs + '</span>';
    str +=  '<br>Horas';
    str +=  '</span>';
    str +=  '<span class="countdown_section mins">';
    str +=  '<span class="countdown_amount">' + mins + '</span>';
    str +=  '<br>Minutos';
    str +=  '</span>';
    str +=  '<span class="countdown_section secs">';
    str +=  '<span class="countdown_amount">' + secs + '</span>';
    str +=  '<br>Segundos';
    str +=  '</span>';
    str +=  '</span>';
    $('#midnight-countdown').addClass('hasCountdown');
    $('#midnight-countdown').html(str);
  }
  $("#newstep-container").carousel('pause');
  
  $('a[data-slide-to="1"], #lgstep-nav-1 .lgstep-nav-step-3').on('click', function(e) {
    var passedAll = true;
    var def_error = 'Por favor, rellene todos los campos.';
    var step1Fields = ['nombre', 'apellido', 'email-address', 'nombre-de-usuario', 'elige-tu-contrasena', 'confirma-tu-contrasena', 'telefono', 'nivel-de-compromiso'];
    for (var i = 0; i < step1Fields.length; i++) {
      passedAll = checkRequiredField($('#' + step1Fields[i]));
      if(step1Fields[i] == "email-address") {
        passedAll = isEmail($('#' + step1Fields[i]).val());
        if(!passedAll) def_error += '<br>Por favor, introduce una dirección de email válida.';     
      }
      if(step1Fields[i] == "elige-tu-contrasena") {
        if($('#elige-tu-contrasena').val() != $('#confirma-tu-contrasena').val() ) {
          passedAll = false;
        }
        if(!passedAll) def_error += '<br>Por favor, contraseñas no coinciden.';     
      }
      if(!passedAll) break;      
    }
    if(!passedAll) { $('.error-container-step-1').fadeIn().html(def_error); return false; }
    else { $('.error-container-step-1').fadeOut().html(''); }
  });

  $('a[data-slide-to="2"]').on('click', function(e) {
    var passedAll = true;
    var def_error = 'Por favor, rellene todos los campos.';
    var step1Fields = ['pais', 'direccion', 'ciudad', 'estado', 'codigo-postal'];
    for (var i = 0; i < step1Fields.length; i++) {
      passedAll = checkRequiredField($('#' + step1Fields[i]));
      if(!passedAll) break;      
    }
    if(!passedAll) { $('.error-container-step-2').fadeIn().html(def_error); return false; }
    else { $('.error-container-step-2').fadeOut().html(''); }
  });


  function checkRequiredField(field) {
    if ( ! $(field).val() ) { return false; }
    else { return true;}
  }
  
  $('#med-navbar').affix({
    offset: {
      top: $('#med-navbar').offset().top
    }
  });

  $('.link-to-signup').on('click', function(e) {
    $('body,html').animate({
        scrollTop: $('.section-precio').offset().top - $('#med-navbar').outerHeight(true) - 20
      }, 800);
    return false;
  });

});

function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}