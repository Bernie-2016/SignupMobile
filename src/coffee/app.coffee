$ ->
  $('#phone').mask '(999) 999-9999'
  $('#zip').mask '99999'

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
    
  $('#submit-form').on 'click', (e) ->
    e.preventDefault()
    data = 
      first_name: $('#first_name').val()
      last_name: $('#last_name').val()
      phone: $('#phone').val()
      email: $('#email').val()
      zip: $('#zip').val()
      canText: $('#canText').prop('checked')

    $('section.form').hide()
    $('section.ticket').show()
    
    string = JSON.stringify([
      'first_name'
      'last_name'
      'phone'
      'email'
      'zip'
      'canText'
    ].map( (key) -> data[key] )).slice(1, -1)

    # Generate QR code
    $('#qr-img').qrcode
      render: 'image'
      text: string
      size: 375
      fill: '#147FD7'
      background: '#FFF'

    # Create canvas
    canvas = new fabric.Canvas('qr')
    canvas.selection = false
    canvas.setBackgroundColor('#ffffff')

    # Add text to canvas
    text = new fabric.Text('Bernie 2016', top: 15, left: 90, fontFamily: 'jubilat', fill: '#147FD7')
    canvas.add(text)
    text.set(evented: false)
    text = new fabric.Text('Event Ticket', top: 462.5, left: 90, fontFamily: 'jubilat', fill: '#147FD7')
    canvas.add(text)
    text.set(evented: false)

    # Add img to canvas
    fabric.Image.fromURL $('#qr-img img').attr('src'), (img) ->
      img.set(top: 72.5, left: 12.5, evented: false)
      canvas.add(img)

      # Set save button to download the canvas
      $('#save').attr('href', canvas.toDataURL())

      # Set print button to print the canvas
      $('#print').on 'click', ->
        windowContent = "<html><body><img src='#{canvas.toDataURL()}' /></body></html>"
        printWin = window.open()
        printWin.document.open()
        printWin.document.write(windowContent)
        printWin.document.close()
        printWin.focus()
        printWin.print()
        printWin.close()
