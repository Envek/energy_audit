# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".activity_values_form_table").on("change keyup", "input[type=number]", ->
    total = 0.0
    $.each( $(".component_financing input[type=number]", $(this).closest("tr")), (index, elem) ->
      total += parseFloat($(this).val())
    )
    $(".total_financing input[type=number]").val(total)
  )
