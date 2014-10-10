define (require) ->
  WVA = require "WVA"
  require "cs!views/unauthenticated/indexView"

  WVA.module "IndexApp.Show", (
  	Show, WVA, Backbone, Marionette, $, _
  ) ->

    class Show.Controller extends Marionette.Controller

      initialize: ->
        @initView()

      initView: ->
        layout = @getLayoutView()
        WVA.mainRegion.show layout

      getLayoutView: ->
        new Show.Layout()

  WVA.IndexApp.Show.Controller