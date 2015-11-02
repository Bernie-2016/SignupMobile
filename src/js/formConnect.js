$(document).on('ready', function() {
  $('#canText').on('change', function() {
    if($(this).is(':checked')) {
      $('#phone').attr('required', true);
    }
    else {
      $('#phone').removeAttr('required');
    }
  });

  $('#email').on('blur', function() {
    $(this).mailcheck({
      suggested: function(element, suggestion) {
        $('div.email-suggestion').data('email-suggestion', suggestion.full);
        $('div.email-suggestion .suggestion').html('Did you mean ' + suggestion.address + '@<strong>' + suggestion.domain + '</strong>?');
        $('div.email-suggestion').show();
      },
      empty: function(element) {
        $('div.email-suggestion').hide();
      }
    });
  });

  $('div.email-suggestion').on('click', function(event) {
    if ($(event.target).is('.x')) {
      return;
    }
    $('#email').val($(this).data('email-suggestion'));
    $('div.email-suggestion').hide();
  });

  $('div.email-suggestion .x').on('click', function() {
    $('div.email-suggestion').hide();
  });

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
    $('#message').show();

    var string = JSON.stringify([
      'first_name',
      'last_name',
      'phone',
      'email',
      'zip',
      'canText'
    ].map(function(key) {
      return data[key];
    })).slice(1, -1);
    var size = Math.min(document.getElementById('qr').clientWidth, 256);

    new QRCode('qr', {
      text: string,
      width: size,
      height: size,
      colorDark: '#147FD7'
    });

    return false;
  });
});
