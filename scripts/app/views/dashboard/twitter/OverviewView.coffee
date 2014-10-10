define (require) ->
  WVA = require 'WVA'
  layoutTpl = 'dashboard/sub_views/twitter/overview/layout'
  chartsTpl = 'dashboard/sub_views/twitter/overview/charts'

  WVA.module 'TwitterOverviewSubApp', (
    SubApp, WVA, Backbone, Marionette, $, _
  ) ->

    class SubApp.Layout extends Marionette.Layout
      className: 'twitter twitter-overview'
      template: WVA.template layoutTpl

      regions:
        subChartRegion: '.chart-container'

    class SubApp.SubView extends Marionette.ItemView
      className: 'twitter twitter-overview'
      template: WVA.template chartsTpl

      events:
        'click .js-navigate-twitter-profile' : 'profilesNav'

      templateHelpers: ->
        Handlebars.registerHelper "increment", (i, options) ->
          i + 1
        Handlebars.registerHelper "twoDec", (i, options) ->
          i.toFixed(2)

        Handlebars.registerHelper "formatNum", (i, options) ->
          i.numberFormat(0)



      profilesNav: (e) ->
        id = e.currentTarget.id
        $('.sidebar-nav a').removeClass 'active'
        $('.sidebar-nav #' + id).addClass 'active'
        WVA.trigger 'toggle:dashboard:subviews', id

  WVA.TwitterOverviewSubApp