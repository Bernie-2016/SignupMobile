$('.submit-form').click(function() {
  var data = {
    first_name: $('#first_name').val(),
    last_name: $('#last_name').val(),
    phone: $('#phone').val(),
    email: $('#email').val(),
    zip: $('#zip').val(),
    canText: $('#canText').prop('checked'),
  };

  DisplayQR(data, 'qr');
});
