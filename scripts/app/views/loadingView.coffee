define (require) ->
  WVA = require "WVA"
  sidebarTpl = "loading/intro_load"
  betweenTpl = "loading/between_loader"

  WVA.module "LoadingApp.Show" , (
    Show, GMA, Backbone, Marionette, $, _
  ) ->

    class Show.Loader extends Marionette.ItemView
      template: GMA.template sidebarTpl

      onRender: ->
        @_unwrap()

      _unwrap: ->
        @$el = @$el.children()
        @$el.unwrap()
        @setElement @$el


    class Show.BetweenLoader extends Marionette.ItemView
      template: GMA.template betweenTpl

      ui:
        build : '.build'
        render : '.render'
        sorry : '.sorry'

      onRender: ->
        @_unwrap()

      _unwrap: ->
        @$el = @$el.children()
        @$el.unwrap()
        @setElement @$el

      onShow: ->
        swap_one = =>
          @ui.build.fadeOut 'fast', =>
            @ui.render.fadeIn()
        swap_two = =>
          @ui.render.fadeOut 'fast', =>
            @ui.sorry.fadeIn()
        # _.delay swap_one, 3500
        # _.delay swap_two, 7000

  WVA.LoadingApp.Show