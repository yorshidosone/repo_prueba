function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}
var cont = 0;
function add_fields(link, association, content) {
  cont = cont + 1;
  if(cont < 3){
	  var new_id = cont;
	  var regexp = new RegExp("new_" + association, "g");
	  $(link).before(content.replace(regexp, new_id));
  }
  else {
  	alert('Campos excedidos para una sola factura')
  }
}