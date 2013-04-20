# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(() ->
  console.log("stuff")
  $("#light.switch").on('switch-change', (evt, data) ->
    $el = $(data.el)
    url = if data.value then $el.data('on-url') else $el.data("off-url")
    $.ajax(url: url, type: "PUT")
  )
)