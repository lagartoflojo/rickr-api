// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {
  $('.paso').corner();
  $('.caja img').corner('7px');
  $('input').click(function() {
    if(this.value == this.title)
      this.value = ''
  });
  $('input').blur(function() {
    if(this.value == '')
      this.value = this.title
  });
  $('#formulario_home form').submit(function() {
    return validarCamposVacios('#formulario_home form');
  });
  $('#new_usuario').submit(function() {
    return validarCamposVacios('#new_usuario');
  });
});
function validarCamposVacios(id) {
	var valido = true;
	/* Pintar blanco los campos primero */
	$(id+' input').removeClass('inputError');
	$(id+' input:not(:submit)').each(function(indice, elemento){
		if($(elemento).val() == '' || $(elemento).val() == null) {
			$(elemento).addClass('inputError');
			valido = false;
		}
	});
	return valido;
}