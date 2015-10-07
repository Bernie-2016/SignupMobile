$('.signup').submit(function(e) {
  e.preventDefault();

  var data = {
    first_name: $('#first_name').val(),
    last_name: $('#last_name').val(),
    phone: $('#phone').val(),
    email: $('#email').val(),
    zip: $('#zip').val(),
    canText: $('#canText').prop('checked'),
  };

  $('.signup').hide();
  $('#qr').show();

  DisplayQR(data, 'qr');

  return false;
});
