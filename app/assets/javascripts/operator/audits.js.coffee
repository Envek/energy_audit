# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".audits_form_table").on("change keyup", "input[type=number]", ->
    audited = parseInt($(".audited_in_period input[type=number]").val())
    required = parseInt($(".audit_required input[type=number]").val())
    percentage = (audited*100.0)/required
    $(".audited_percentage").text(percentage.toFixed(2)+"%")
  )
