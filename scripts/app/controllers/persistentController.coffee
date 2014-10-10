define (require) ->
  WVA = require "WVA"
  require "cs!views/persistentView"
  require 'cs!common/uriParser'

  WVA.module "PersistentApp.Show", (
    Show, WVA, Backbone, Marionette, $, _
  ) ->

    class Show.Controller extends Marionette.Controller

      initialize: ->
        @sidebarView = @_getSidebarView()
        @_sidebarEvents()
        WVA.sidebarRegion.show @sidebarView

      _sidebarEvents: ->
        WVA.on 'sidebar:toggle', =>
          @sidebarView.toggleSidebar()
        WVA.on 'sidebar:active:state', =>
          target = WVA.sidebarParser location.hash.replace('#dashboard/','')
          if target and target.indexOf('twitter') isnt -1
            @sidebarView._toggleTwitterMenu $(target)
          @sidebarView.updateActiveState target

        @listenTo @sidebarView, 'navigate', (target) ->
          WVA.trigger 'toggle:dashboard:subviews', target

      _getSidebarView: ->
        new Show.Sidebar()

  WVA.PersistentApp.Show.Controller