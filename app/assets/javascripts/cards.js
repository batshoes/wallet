$(document).ready(function(){
  $('#card_number').on('keyup', function(){
    var firstDigit = $('#card_number').val()[0]
    if (!(firstDigit == '3' || firstDigit == '4' || firstDigit == '5')) function(){
    $('#card_number').empty();

    }
      
  });

});