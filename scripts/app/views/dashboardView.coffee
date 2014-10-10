define (require) ->
  WVA = require "WVA"
  layoutTpl = "dashboard/layout"
  headerNavTpl = "dashboard/header_nav"
  footerTpl = "dashboard/footer"
  baseTpl = 'dashboard/base_view'
  overviewTpl = 'dashboard/sub_views/overview'
  require 'd3'
  require 'nvd3'
  require 'd3Queue'
  require 'venn'
  require 'leaflet'
  require 'datatables'
  require 'verge'
  require 'cs!../../lib/local/dataTable_extensions'

  WVA.module "DashboardApp.Show" , (
    Show, GMA, Backbone, Marionette, $, _
  ) ->

    class Show.Layout extends Marionette.Layout
      template: GMA.template layoutTpl

      regions:
        headerNavRegion : '#header-nav'
        chartsRegion : '#charts-region'
        footerRegion : 'footer'

      ui:
        chartsRegion : '#charts-region'

      onShow: ->
        @setViewPortHeight()

      setViewPortHeight: ->
        h = verge.viewportH()
        @ui.chartsRegion.css
          'min-height' : (h + 'px')


    class Show.HeaderNav extends Marionette.ItemView
      template: GMA.template headerNavTpl
      tagName: 'header'
      className: 'navbar navbar-default'
      events:
        'click #toggle-sidebar' : "_toggleSidebar"
        'click #logout' : "_requestLogout"

      _toggleSidebar: -> WVA.trigger 'sidebar:toggle'
      _requestLogout: -> WVA.trigger 'logout'

    class Show.Footer extends Marionette.ItemView
      template: GMA.template footerTpl
      className: 'pull-left'