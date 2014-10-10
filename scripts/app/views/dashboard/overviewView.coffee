define (require) ->
  WVA = require 'WVA'
  layoutTpl = 'dashboard/sub_views/overview/layout'
  chartTpl = 'dashboard/sub_views/overview/charts'


  WVA.module 'OverviewSubApp', (
    SubApp, WVA, Backbone, Marionette, $, _
  ) ->

    class SubApp.Layout extends Marionette.Layout
      className: 'overview'
      template: WVA.template layoutTpl

      regions:
        subChartRegion: '.chart-container'

    class SubApp.SubView extends Marionette.ItemView
      template: WVA.template chartTpl
      ui:
        chart_one : '#email_pie_chart_1 svg'

      onRender: ->
        @_buildDistributionData()

      onShow: ->
        @_setSvgWidth()
        @_setGraphLabels()
        @_renderGenderChart()
        @_renderDistributionSocialProfiles()

      _setSvgWidth: ->
        $('#chart svg').css 'width', "100%"

      _setGraphLabels: ->
        nv.addGraph =>
          email_pie_chart_1 = email_pie_chart_2 = nv.models.pieChart().x((d) ->
            d.label
          ).y((d) ->
            d.value
          ).showLabels(true)
          @_renderTopDomainsGraph email_pie_chart_1
          @_renderEmailsByProviderGraph email_pie_chart_2

      _buildDistributionData: ->
        @distro = [{
          key: "Cumulative Return",
          values:  @model.get('hist_social_networks')
        }]

      _renderTopDomainsGraph: (email_pie_chart_1) ->
          email_pie_chart_1.valueFormat(d3.format('d'))
          d3.select("#email_pie_chart_1 svg")
            .datum(@model.get('email_tlds_chart'))
            .transition().duration(350)
            .call(email_pie_chart_1)

      _renderEmailsByProviderGraph: (email_pie_chart_2) ->
        d3.select("#email_pie_chart_2 svg")
          .datum(@model.get('email_providers_chart'))
          .transition().duration(350)
          .call email_pie_chart_2
        email_pie_chart_2.valueFormat d3.format("d")

      _renderDistributionSocialProfiles: ->
        nv.addGraph =>
          chart = nv.models.discreteBarChart().x((d) ->
            d.label
          ).y((d) ->
            d.value
          ).staggerLabels(false).tooltips(false).showValues(true).valueFormat(d3.format("d")).transitionDuration(350)
          chart.yAxis.tickFormat d3.format("d")
          chart.xAxis.rotateLabels -45
          chart.margin bottom: 80
          d3.select("#chart svg").datum(@distro).call chart
          nv.utils.windowResize chart.update
          chart

      _renderGenderChart: ->
        nv.addGraph =>
          chart2 = nv.models.pieChart().x((d) ->
            d.label
          ).y((d) ->
            d.value
          ).valueFormat(d3.format("d")).showLabels(true)
          chart2.color [
            "#1f78b4"
            "#e31a1c"
          ]
          d3.select("#malefemale svg").datum(@model.get('gender_count')).transition().duration(350).call chart2

      templateHelpers: ->
        Handlebars.registerHelper 'processed', ->
          @total_emails_processed.numberFormat(0)

        Handlebars.registerHelper 'avgProfiles', ->
          @avg_profiles_per_email.toFixed(2)

  WVA.OverviewSubApp