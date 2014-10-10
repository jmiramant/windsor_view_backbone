define [
  "cs!WVA"
], (
  WVA
) ->

  WVA.GlobalHandlers =

    initialize: ->
      @_initAjax()
      @

    _initAjax: ->

      $(document)

        .on 'click', 'a[href="#"]', (event) ->
          event.preventDefault()
          event.stopPropagation()
          false
