# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".measuring_devices_form_table").on("change keyup", "input[type=number]", ->
    start = parseInt($("#measuring_device_start_value").val())
    planned = parseInt($("#measuring_device_planned_value").val())
    final = parseInt($("#measuring_device_final_value").val())
    eq_lvl = (final*100.0)/(start+planned)
    $(".equipment_level").text(eq_lvl.toFixed(2)+"%")
  )
