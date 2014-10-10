define ["jquery"], ->

  Array::remove = (value) ->
    i = 0
    while i < @length
      if @[i] == value
        @splice i, 1
      else
        ++i
    return @

  Array::unique = ->
    output = {}
    output[@[key]] = @[key] for key in [0...@length]
    value for key, value of output

  Number::times = (fn) ->
    do fn for [1..@valueOf()]
    return

  Array.prototype.removeByArray = (args) ->
    output = []
    for arg in args
      index = @indexOf arg
      output.push @splice(index, 1) if index isnt -1
    output = output[0] if args.length is 1
    output

  Array::last = ->
    l = @length
    @[l-1]

  Array::compact = ->
    item for item in @ when item

  String::capitalize = ->
    @replace /\w\S*/g, (txt) ->
      txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()

  Number::numberFormat = (decimals, dec_point, thousands_sep) ->
    dec_point = (if typeof dec_point isnt "undefined" then dec_point else ".")
    thousands_sep = (if typeof thousands_sep isnt "undefined" then thousands_sep else ",")
    parts = @toFixed(decimals).split(".")
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, thousands_sep)
    parts.join dec_point