define [
  "cs!WVA"
  "handlebars"
  "text!templates/shared/loading.html"
], (
  WVA,
  Handlebars
  loadingTpl
  spinspin
) ->

  WVA.module "Loading.Views", (
    Views, WVA, Backbone, Marionette, $, _
  ) ->

    class Views.Spinner extends Marionette.ItemView
      template: Handlebars.compile loadingTpl
      ui:
        loader: '#loader'

      initialize: (top = '40%', left = '50%') ->
        @opts =
          lines: 11
          length: 15
          width: 8
          radius: 13
          corners: 1
          rotate: 0
          direction: 1
          color: '#A3A3A3'
          speed: 1
          trail: 60
          shadow: false
          hwaccel: false
          className: 'spinner'
          zIndex: 2e9
          top: top
          left: left

      dropPosition: (top) -> $('.spinner').css 'top', top

      onShow: ->
        require ['spin','spin-jquery'], (Spinner) =>
          @$el.find('#loader').spin @opts

  WVA.Loading.Views
