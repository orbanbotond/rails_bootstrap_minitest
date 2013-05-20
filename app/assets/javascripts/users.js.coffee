$ ->
  enable = ( selector ) ->
    $(".edit_user div.administratable").removeClass('hidden')
    $(".new_user div.administratable").removeClass('hidden')
    $(selector).prop('disabled', false);
    $(selector).show()

  disable = ( selector ) ->
    $(selector).prop('disabled', true);
    $(selector).hide()

  check = ->
    text = $("#user_role option:selected").text()
    if 'buyer' == text
      enable('.client.administratable')
      disable('.supplier.administratable')
    if 'supplier' == text
      disable('.client.administratable')
      enable('.supplier.administratable')
    if 'admin' == text
      $(".edit_user div.administratable").addClass('hidden')
      $(".new_user div.administratable").addClass('hidden')
      disable('.supplier.administratable')
      disable('.client.administratable')

  check()
  
  $('#user_role').change ->
    check()
