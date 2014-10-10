define [
  "cs!WVA"
], (
  WVA
) ->

  WVA.resizer = (textVal, options, model) ->
    count = 1
    $('body').append '<div id=' + textVal + ' style=visibility:hidden;' + options.style + '></div>'
    resizer = $("#" + textVal)
    attr = if textVal is 'question-text' then 'text' else textVal
    resizer.html model.get(attr)
    if resizer.height() <= options.height
      $("." + textVal).html(model.get(attr))
    else
      while resizer.height() > options.height
        count = count + 1 if lh and size
        size = parseInt resizer.css("font-size"), 10
        lh = parseInt resizer.css("line-height")
        resizer.css
          "font-size": (size - 1)
          "line-height": String((lh-1) + 'px')
      $("." + textVal).css
        "font-size": size-1
        'line-height': String((lh-1) + 'px')
      .html model.get(attr)
    resizer.remove()


  WVA.resizer
