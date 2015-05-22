function handleEnter (field, event) {
var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
if (keyCode == 13) {
 var i;
 var cols=11;
 //alert(field.form.elements.length);
 //alert(cols);
 for (i = 0; i < field.form.elements.length; i++)
  if (field == field.form.elements[i])
  break;
  //i = (i + 1) % field.form.elements.length;
  if (i<field.form.elements.length-cols){
  field.form.elements[i+cols].focus();
  return false;
  }
  }
  else
  return true;
}
 
//方向键控制