$(document).ready(function(){

  if (Cookies.get('name')){
    var name = Cookies.get('name');
    $('#greeting').html(name);
  };

  $('#cookie-name').on('submit',function(){
    var name = $('#cookie-name input[name=name]').val()
    Cookies.set('name', name);
  });
});