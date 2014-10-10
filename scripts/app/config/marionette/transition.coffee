define ["marionette", "modernizer", "point", "matrix"], (Marionette) ->
  
  Marionette.TransitionRegion = Marionette.Region.extend(
    addBaseAnimate: (view) ->
      styles =
        "-moz-transition": "margin-left .25s, margin-right .25s"
        "-webkit-transition": "margin-left .25s, margin-right .25s"
        "-o-transition": "margin-left .25s, margin-right .25s"
        "-ms-transition": "margin-left .25s, margin-right .25s"
        transition: "margin-left .25s, margin-right .25s"
      view.$el.css styles

    addTransitionInit: (view, region) ->
      styles =
        "margin-left": (region.$el.width() * 1) + "px"
        "margin-right": (region.$el.width() * -1) + "px"
      view.$el.css styles

    removeTransitionInit: (view) ->
      styles =
        "margin-left": ""
        "margin-right": ""
      view.$el.css styles

    addTransitionIn: (view) ->
      styles =
        "margin-left": "0px"
        "margin-right": "0px"
      view.$el.css styles

    removeTransitionIn: (view) ->
      styles =
        "margin-left": ""
        "margin-right": ""
      view.$el.css styles

    addTransitionOut: (view) ->
      styles =
        "margin-left": (view.$el.parent().width() * -1) + "px"
        "margin-right": (view.$el.parent().width() * 1) + "px"
      view.$el.css styles

    removeTransitionOut: (view) ->
      styles =
        "margin-left": ""
        "margin-right": ""
      view.$el.css styles

    show: (view) ->
      self = this
      @ensureEl()
      isViewClosed = view.isClosed or _.isUndefined(view.$el) or @currentView is `undefined`
      isDifferentView = view isnt @currentView
      if isDifferentView
        @promiseClose(view).done ->
          self.addBaseAnimate view
          self.addTransitionInit view, self
          view.render()
          self.open view  if isDifferentView or isViewClosed
          self.currentView = view
          view.$el.on "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", ->
            view.$el.off "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"
            self.removeTransitionInit view
            return
          setTimeout (->
            self.addTransitionIn view
            return
          ), 1
          Marionette.triggerMethod.call self, "show", view
          Marionette.triggerMethod.call view, "show"
          return
      return

    promiseClose: (view) ->
      self = this
      deferred = $.Deferred()
      if not self.currentView or self.currentView.isClosed
        deferred.resolve()
        return deferred.promise()
      cView = @currentView
      cView.$el.on "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", ->
        cView.$el.off "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"
        self.removeTransitionOut cView
        self.close()
        deferred.resolve()
      self.removeTransitionIn cView
      self.addTransitionOut cView
      unless self.isTransitionSupported()
        self.removeTransitionOut cView
        self.close()
        deferred.resolve()
      deferred.promise()

    isTransitionSupported: ->
      style = undefined
      style = document.documentElement.style
      (style.webkitTransition) isnt `undefined` or (style.MozTransition) isnt `undefined` or (style.OTransition) isnt `undefined` or (style.MsTransition) isnt `undefined` or (style.transition) isnt `undefined`
  )
  Marionette.TransitionRegion