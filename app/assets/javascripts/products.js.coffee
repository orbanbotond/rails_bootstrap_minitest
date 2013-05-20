# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#products_upload').bind 'fileuploaddone', ->
    console.debug "Upload Done!"

  $('#products_upload').fileupload
      dataType: "script"
      add: (e, data) ->
        types = /(\.|\/)(csv)$/i
        file = data.files[0]
        if types.test(file.type) || types.test(file.name)
          data.context = $('.upload .progress .bar')
          data.submit()
        else
          alert("#{file.name} is not a csv file")
      progress: (e, data) ->
        if data.context
          progress = parseInt(data.loaded / data.total * 100, 10)
          data.context.css('width', progress + '%')
      done: (e, data) ->
        console.debug "Upload Done!"
