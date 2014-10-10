define ["backbone"], (Backbone) ->
  (->
    __bind_ = (fn, me) ->
      ->
        fn.apply me, arguments_

    __hasProp_ = {}.hasOwnProperty
    __extends_ = (child, parent) ->
      ctor = ->
        @constructor = child
        return
      for key of parent
        child[key] = parent[key]  if __hasProp_.call(parent, key)
      ctor:: = parent::
      child:: = new ctor()
      child.__super__ = parent::
      child

    __indexOf_ = [].indexOf or (item) ->
      i = 0
      l = @length

      while i < l
        return i  if i of this and this[i] is item
        i++
      -1

    throw new Error("Backbone is not defined. Please include the latest version from http://documentcloud.github.com/backbone/backbone.js")  if typeof Backbone is "undefined" or Backbone is null
    Backbone.Modal = ((_super) ->
      Modal = ->
        @triggerCancel = __bind_(@triggerCancel, this)
        @triggerSubmit = __bind_(@triggerSubmit, this)
        @triggerView = __bind_(@triggerView, this)
        @clickOutside = __bind_(@clickOutside, this)
        @checkKey = __bind_(@checkKey, this)
        @args = Array::slice.apply(arguments_)
        Backbone.View::constructor.apply this, @args
        @setUIElements()
        @delegateModalEvents()
        return
      __extends_ Modal, _super
      Modal::prefix = "bbm"
      Modal::render = (options) ->
        data = undefined
        _ref = undefined
        _this = this
        options = {}  unless options?
        data = @serializeData()
        @$el.addClass "" + @prefix + "-wrapper"
        @modalEl = Backbone.$("<div />").addClass("" + @prefix + "-modal")
        @modalEl.html @template(data)  if @template
        @$el.html @modalEl
        Backbone.$("body").on "keyup", @checkKey
        Backbone.$("body").on "click", @clickOutside
        if @viewContainer
          @viewContainerEl = @modalEl.find(@viewContainer)
          @viewContainerEl.addClass "" + @prefix + "-modal__views"
        else
          @viewContainerEl = @modalEl
        @$el.show()
        @openAt 0  if ((if (_ref = @views)? then _ref.length else undefined)) > 0
        @onRender()  if typeof @onRender is "function"
        @modalEl.css opacity: 0
        @$el.fadeIn
          duration: 100
          complete: ->
            _this.modalEl.css(opacity: 1).addClass "" + _this.prefix + "-modal--open"

        this

      Modal::setUIElements = ->
        _ref = undefined
        @template = @getOption("template")
        @views = @getOption("views")
        _ref.length = _.size(@views)  if (_ref = @views)?
        @viewContainer = @getOption("viewContainer")
        @$el.hide()
        throw new Error("No template or views defined for Backbone.Modal")  if _.isUndefined(@template) and _.isUndefined(@views)
        throw new Error("No viewContainer defined for Backbone.Modal")  if @template and @views and _.isUndefined(@viewContainer)
        return

      Modal::getOption = (option) ->
        return  unless option
        if @options and __indexOf_.call(@options, option) >= 0 and (@options[option]?)
          @options[option]
        else
          this[option]

      Modal::serializeData = ->
        data = undefined
        data = {}
        data = _.extend(data, @model.toJSON())  if @model
        if @collection
          data = _.extend(data,
            items: @collection.toJSON()
          )
        data

      Modal::delegateModalEvents = ->
        cancelEl = undefined
        key = undefined
        match = undefined
        selector = undefined
        submitEl = undefined
        trigger = undefined
        _results = undefined
        @active = true
        cancelEl = @getOption("cancelEl")
        submitEl = @getOption("submitEl")
        @$el.on "click", submitEl, @triggerSubmit  if submitEl
        @$el.on "click", cancelEl, @triggerCancel  if cancelEl
        _results = []
        for key of @views
          if key isnt "length"
            match = key.match(/^(\S+)\s*(.*)$/)
            trigger = match[1]
            selector = match[2]
            _results.push @$el.on(trigger, selector, @views[key], @triggerView)
          else
            _results.push undefined
        _results

      Modal::undelegateModalEvents = ->
        cancelEl = undefined
        key = undefined
        match = undefined
        selector = undefined
        submitEl = undefined
        trigger = undefined
        _results = undefined
        @active = false
        cancelEl = @getOption("cancelEl")
        submitEl = @getOption("submitEl")
        @$el.off "click", submitEl, @triggerSubmit  if submitEl
        @$el.off "click", cancelEl, @triggerCancel  if cancelEl
        _results = []
        for key of @views
          if key isnt "length"
            match = key.match(/^(\S+)\s*(.*)$/)
            trigger = match[1]
            selector = match[2]
            _results.push @$el.off(trigger, selector, @views[key], @triggerView)
          else
            _results.push undefined
        _results

      Modal::checkKey = (e) ->
        if @active
          switch e.keyCode
            when 27
              @triggerCancel()
            when 13
              @triggerSubmit()

      Modal::clickOutside = (e) ->
        @triggerCancel null, true  if Backbone.$(e.target).hasClass("" + @prefix + "-wrapper") and @active

      Modal::buildView = (viewType) ->
        view = undefined
        return  unless viewType
        if _.isFunction(viewType)
          view = new viewType(@args[0])
          if view instanceof Backbone.View
            return (
              el: view.render().$el
              view: view
            )
          else
            return el: viewType(@args[0])
        view: viewType
        el: viewType.$el

      Modal::triggerView = (e) ->
        index = undefined
        instance = undefined
        key = undefined
        options = undefined
        e.preventDefault()  if typeof e.preventDefault is "function"  if e?
        options = e.data
        instance = @buildView(options.view)
        @previousView = @currentView  if @currentView
        @currentView = instance.view or instance.el
        index = 0
        for key of @views
          @currentIndex = index  if options.view is @views[key].view
          index++
        if options.onActive
          if _.isFunction(options.onActive)
            options.onActive this
          else this[options.onActive].call this, options  if _.isString(options.onActive)
        if @shouldAnimate
          @animateToView instance.el
        else
          @shouldAnimate = true
          @$(@viewContainerEl).html instance.el

      Modal::animateToView = (view) ->
        container = undefined
        newHeight = undefined
        previousHeight = undefined
        style = undefined
        tester = undefined
        _ref = undefined
        _this = this
        style =
          position: "relative"
          top: -9999
          left: -9999

        tester = Backbone.$("<tester/>").css(style)
        tester.html @$el.clone().css(style)
        if Backbone.$("tester").length isnt 0
          Backbone.$("tester").replaceWith tester
        else
          Backbone.$("body").append tester
        if @viewContainer
          container = tester.find(@viewContainer)
        else
          container = tester.find("." + @prefix + "-modal")
        container.removeAttr "style"
        previousHeight = container.outerHeight()
        container.html view
        newHeight = container.outerHeight()
        if previousHeight is newHeight
          @$(@viewContainerEl).html view
          (if (_ref = @previousView)? then (if typeof _ref.close is "function" then _ref.close() else undefined) else undefined)
        else
          @$(@viewContainerEl).css opacity: 0
          @$(@viewContainerEl).animate
            height: newHeight
          , 100, ->
            _ref1 = undefined
            _this.$(_this.viewContainerEl).css(opacity: 1).removeAttr "style"
            _this.$(_this.viewContainerEl).html view
            (if (_ref1 = _this.previousView)? then (if typeof _ref1.close is "function" then _ref1.close() else undefined) else undefined)


      Modal::triggerSubmit = (e) ->
        e.preventDefault()  if e?
        return  if @beforeSubmit() is false  if @beforeSubmit
        @submit()  if typeof @submit is "function"
        if @regionEnabled
          @trigger "modal:close"
        else
          @close()

      Modal::triggerCancel = (e) ->
        e.preventDefault()  if e?
        return  if @beforeCancel() is false  if @beforeCancel
        @cancel()  if typeof @cancel is "function"
        if @regionEnabled
          @trigger "modal:close"
        else
          @close()

      Modal::close = ->
        _this = this
        Backbone.$("body").off "keyup", @checkKey
        Backbone.$("body").off "click", @clickOutside
        @onClose()  if typeof @onClose is "function"
        @shouldAnimate = false
        @modalEl.addClass "{@prefix}-modal--close"
        @$el.fadeOut duration: 200
        _.delay (->
          _ref = undefined
          _ref.remove()  if typeof _ref.remove is "function"  if (_ref = _this.currentView)?
          _this.remove()
        ), 200

      Modal::openAt = (index) ->
        i = undefined
        key = undefined
        view = undefined
        i = 0
        for key of @views
          if key isnt "length"
            view = @views[key]  if i is index
            i++
        if view
          @currentIndex = index
          @triggerView data: view
        this

      Modal::next = ->
        @openAt @currentIndex + 1  if @currentIndex + 1 < @views.length

      Modal::previous = ->
        @openAt @currentIndex - 1  if @currentIndex - 1 < @views.length - 1

      Modal
    )(Backbone.View)
    return
  ).call this
  (->
    _ref = undefined
    __bind_ = (fn, me) ->
      ->
        fn.apply me, arguments_

    __hasProp_ = {}.hasOwnProperty
    __extends_ = (child, parent) ->
      ctor = ->
        @constructor = child
        return
      for key of parent
        child[key] = parent[key]  if __hasProp_.call(parent, key)
      ctor:: = parent::
      child:: = new ctor()
      child.__super__ = parent::
      child

    throw new Error("Backbone is not defined. Please include the latest version from http://documentcloud.github.com/backbone/backbone.js")  if typeof Backbone is "undefined" or Backbone is null
    Backbone.Marionette.Modals = ((_super) ->
      Modals = ->
        @close = __bind_(@close, this)
        _ref = Modals.__super__.constructor.apply(this, arguments_)
        _ref
      __extends_ Modals, _super
      Modals::modals = []
      Modals::zIndex = 0
      Modals::show = (modal, options) ->
        lastModal = undefined
        m = undefined
        secondLastModal = undefined
        _i = undefined
        _len = undefined
        _ref1 = undefined
        options = {}  unless options?
        @ensureEl()
        if @modals.length > 0
          lastModal = _.last(@modals)
          lastModal.modalEl.addClass "" + lastModal.prefix + "-modal--stacked"
          secondLastModal = @modals[@modals.length - 1]
          secondLastModal.modalEl.removeClass "" + secondLastModal.prefix + "-modal--stacked-reverse"  if secondLastModal?
        modal.render()
        modal.regionEnabled = true
        @$el.show()
        @$el.append modal.el
        modal.$el.css background: "none"  if @modals.length > 0
        Marionette.triggerMethod.call modal, "show"
        Marionette.triggerMethod.call this, "show", modal
        @currentView = modal
        _ref1 = @modals
        _i = 0
        _len = _ref1.length

        while _i < _len
          m = _ref1[_i]
          m.undelegateModalEvents()
          _i++
        modal.on "modal:close", @close
        @modals.push modal
        @zIndex++

      Modals::close = ->
        lastModal = undefined
        modal = undefined
        _this = this
        modal = @currentView
        return  if not modal or modal.isClosed
        if modal.close
          modal.close()
        else modal.remove()  if modal.remove
        modal.off "modal:close", @close
        @modals.splice _.indexOf(@modals, modal), 1
        @zIndex--
        @currentView = @modals[@zIndex - 1]
        lastModal = _.last(@modals)
        if lastModal
          lastModal.modalEl.addClass "" + lastModal.prefix + "-modal--stacked-reverse"
          _.delay (->
            lastModal.modalEl.removeClass "" + lastModal.prefix + "-modal--stacked"
          ), 300
          lastModal.delegateModalEvents()  if @zIndex isnt 0
        Marionette.triggerMethod.call this, "close"

      Modals::closeAll = ->
        modal = undefined
        _i = undefined
        _len = undefined
        _ref1 = undefined
        _results = undefined
        _ref1 = @modals
        _results = []
        _i = 0
        _len = _ref1.length

        while _i < _len
          modal = _ref1[_i]
          _results.push @close()
          _i++
        _results

      Modals
    )(Backbone.Marionette.Region)
    return
  ).call this