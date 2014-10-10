define ["marionette"], (Marionette) ->

  Marionette.ItemView.Modal = Marionette.ItemView.extend(

    initialize: (openDirection, closeDirection) -> 
      @oDir = openDirection
      @cDir = if closeDirection then closeDirection else openDirection

    onShow: -> 
      @slideDown()

    slideDown: -> 
      self = @
      $trg = $('#'+ @id)
      $trg.hide()
      $('#modal-region').fadeIn 'fast', ->
        $trg.show "slide",
          direction: self.oDir, 250

    close: -> 
      self = @
      $trg = $('#'+ @id)
      $trg.hide "slide",
        direction: self.cDir, 300, ->
          $('#modal-region').fadeOut 'fast', ->
            self.trigger 'close:modal'
  )

  Marionette.ItemView.Modal 