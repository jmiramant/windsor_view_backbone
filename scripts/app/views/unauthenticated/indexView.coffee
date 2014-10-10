define (require) ->
  WVA = require "WVA"
  layoutTpl = "unauthenticated/index_layout"

  WVA.module "IndexApp.Show", (
    Show, WVA, Backbone, Marionette, $, _
  ) ->

    class Show.Layout extends Marionette.Layout
      template: WVA.template layoutTpl
      id: "index-layout"
      events:
        'click .logotext' :  '_showLogin'
        'click .contact' :  '_showLogin'

      onShow: -> WVA.trigger 'full:view:toggle', 'full'

      _showLogin: (e) ->
        e.preventDefault()
        WVA.trigger 'show:login'

  WVA.IndexApp.Show
