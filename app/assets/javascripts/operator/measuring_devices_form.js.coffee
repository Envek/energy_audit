# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".measuring_devices_form_form_table").on("change keyup", "input[type=number]", ->
    # Update sum
    row = $(this).closest("tr")
    total = parseInt($(this).val())
    $.each( $(this).parent().prevUntil(":not(.with_input)"), (index, elem) ->
      total += parseInt($("input[type=number]", elem).val())
    )
    $.each( $(this).parent().nextUntil(":not(.with_input)"), (index, elem) ->
      total += parseInt($("input[type=number]", elem).val())
    )
    $(this).parent().nextAll(".sum").first().text(total)
    # Update equipment level
    sums = $(".sum", row);
    start = parseInt($(sums[0]).text())
    planned = parseInt($(sums[1]).text())
    final = parseInt($(sums[2]).text())
    eq_lvl = (final*100.0)/(start+planned)
    $(".equipment_level", row).text(eq_lvl.toFixed(2)+"%")
  )
