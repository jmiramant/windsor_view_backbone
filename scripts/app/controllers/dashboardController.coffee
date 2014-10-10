define (require) ->
  WVA = require "WVA"
  require "cs!entities/Companies"
  require "cs!views/dashboardView"
  require 'cs!common/uriParser'
  require 'verge'

  WVA.module "DashboardApp.Show", (
    Show, WVA, Backbone, Marionette, $, _
  ) ->

    class Show.Controller extends Marionette.Controller

      initialize: (subview) ->
        fetchDashViews = WVA.request 'company:entity'
        @targetSubview = WVA.uriParser subview
        WVA.trigger 'sidebar:active:state'
        buildInitView = @_initView()
        @tableTemplatesRendered = false
        @_subMenuListener()
        $.when(
          fetchDashViews
          buildInitView
        ).done (@dashViews) =>
          @_buildHeaderView()
          @_buildFooterView()
          @_buildChartSubViews()

      _initView: ->
        @layout = @_getLayoutView()
        defer = $.Deferred()
        @listenTo @layout, 'show', ->
          require ["cs!views/loadingView"], (loadingView) =>
            loader = new loadingView.Loader()
            @layout.chartsRegion.show loader
            defer.resolve true
        WVA.mainRegion.show @layout
        defer.promise()

      _subMenuListener: ->
        WVA.on 'toggle:dashboard:subviews', (target) =>
          @targetSubview = WVA.uriParser target
          WVA.trigger 'nav:dashboard:subview', @targetSubview.nav
          @_buildChartSubViews()

      _buildHeaderView: ->
        headerNavView = @_getHeaderNavView()
        @layout.headerNavRegion.show headerNavView

      _buildFooterView: ->        
        footerView = @_getFooterView()
        @layout.footerRegion.show footerView

      _buildChartSubViews: ->
        viewPath = 'cs!views/dashboard/' + @targetSubview.path
        require [viewPath], (@viewModule) =>
          @subLayoutView = new @viewModule.Layout()
          @_showChartView()

      _showChartView: ->
        @layout.chartsRegion.on 'show', =>
          require ['cs!views/loadingView'], (loadingModule) =>
            betweenLoader = new loadingModule.BetweenLoader()
            @subLayoutView.subChartRegion.show(betweenLoader) if @targetSubview.nav in ['twitter/profiles', 'professional']
            subView = => @_showChartSubViews()
            _.delay subView, 10
        @layout.chartsRegion.show @subLayoutView

      _showChartSubViews: ->
        subView = new @viewModule.SubView
          model: @dashViews.get(@targetSubview.data)
        @subLayoutView.subChartRegion.show subView
        @layout.chartsRegion.off 'show'

      # _precompileDataTableTemplate: ->
      #   @dashViews.get('Professional').set('template', WVA.template('dashboard/sub_views/professional/chart')(@dashViews.get('Professional').toJSON()))
      #   @dashViews.get('TwitterProfiles').set('template', WVA.template('dashboard/sub_views/twitter/profiles')(@dashViews.get('TwitterProfiles').toJSON()))
      #   @tableTemplatesRendered = true

      _getLayoutView: ->
        new Show.Layout()

      _getSubView: (model) ->
        new Show.SubView
          model: model

      _getHeaderNavView: ->
        new Show.HeaderNav()

      _getFooterView: -> 
        new Show.Footer()

  WVA.DashboardApp.Show.Controller
