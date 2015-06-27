times =
  "1": "06-09"
  "2": "09-12"
  "3": "12-15"
  "4": "15-18"
  "5": "18-21"
  "6": "21-24"
  "7": "24-03"
  "8": "03-06"
  "m": "Monsoon"

prettyTime = (time) ->
  times[time.toString()]

filter = (attribute, value) ->
  $("tbody tr").hide()
  $("tbody tr[data-#{attribute}=#{value}]").show()

  prettyValue = if attribute == "time" then prettyTime(value) else value

  $(".filter").show()
  $(".filter-name").html "#{attribute} #{prettyValue}"

  zebra()

zebra = ->
  $("tbody tr").removeClass("odd").removeClass "even"
  $("tbody tr:visible:odd").addClass "odd"
  $("tbody tr:visible:even").addClass "even"

$ ->
  table = $("#ragas").stupidtable()

  table.bind "aftertablesort", zebra

  $("td.time a").click (e) ->
    e.preventDefault()
    time = $(@).closest("tr").data("time")
    filter "time", time

  $("td.thaat a").click (e) ->
    e.preventDefault()
    thaat = $(@).closest("tr").data("thaat")
    filter "thaat", thaat

  $("#suggestion-time-filter-link").click (e) ->
    e.preventDefault()
    filter "time", $(@).data("time")
    $("html, body").animate { scrollTop: $("h2").offset().top - 20 }, 500

  $("#remove-filter-link").click (e) ->
    e.preventDefault()
    $(".filter").hide()
    $("tbody tr").show()
    zebra()

  $("th.title").click()
