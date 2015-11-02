$ ->
  $('#phone').mask '(999) 999-9999'

  $('#canText').on 'change', ->
    if $(@).is(':checked')
      $('#phone').attr 'required', true
    else
      $('#phone').removeAttr 'required'

  $('#email').on 'blur', ->
    $(@).mailcheck
      suggested: (element, suggestion) ->
        $('div.email-suggestion').data 'email-suggestion', suggestion.full
        $('div.email-suggestion .suggestion').html "Did you mean #{suggestion.address}@<strong>#{suggestion.domain}</strong>?"
        $('div.email-suggestion').show()
      empty: (element) ->
        $('div.email-suggestion').hide()

  $('div.email-suggestion').on 'click', (event) ->
    return if $(event.target).is('.x')
    $('#email').val $(@).data('email-suggestion')
    $('div.email-suggestion').hide()
    
  $('div.email-suggestion .x').on 'click', ->
    $('div.email-suggestion').hide()
    
  $('.signup').submit (e) ->
    e.preventDefault()
    data = 
      first_name: $('#first_name').val()
      last_name: $('#last_name').val()
      phone: $('#phone').val()
      email: $('#email').val()
      zip: $('#zip').val()
      canText: $('#canText').prop('checked')
    $('.signup').hide()
    $('#qr').show()
    $('#message').show()
    string = JSON.stringify([
      'first_name'
      'last_name'
      'phone'
      'email'
      'zip'
      'canText'
    ].map((key) ->
      data[key]
    )).slice(1, -1)
    size = Math.min(document.getElementById('qr').clientWidth, 256)
    new QRCode 'qr',
      text: string
      width: size
      height: size
      colorDark: '#147FD7'
