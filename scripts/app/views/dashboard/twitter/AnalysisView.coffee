define (require) ->
  WVA = require 'WVA'
  layoutTpl = 'dashboard/sub_views/twitter/analysis/layout'
  chartTpl = 'dashboard/sub_views/twitter/analysis/charts'

  WVA.module 'TwitterAnalysisSubApp', (
    SubApp, WVA, Backbone, Marionette, $, _
  ) ->

    class SubApp.Layout extends Marionette.Layout
      className: 'twitter twitter-overview'
      template: WVA.template layoutTpl

      regions:
        subChartRegion: '.chart-container'

    class SubApp.SubView extends Marionette.ItemView
      className: 'twitter twitter-analysis'
      template: WVA.template chartTpl

      onShow: ->
        @data = @model.get('twitter_analytics')
        @_renderKeyWords()
        @_renderHashtags()
        @_renderUserMentions()

      _renderKeyWords: ->
        abc = @data.search_word_output
        nv.addGraph ->
          stream_chart1 = nv.models.stackedAreaChart().margin(right: 100).x((d) ->
            d[0]
          ).y((d) ->
            d[1]
          ).useInteractiveGuideline(true).rightAlignYAxis(true).transitionDuration(500).showControls(true).clipEdge(true)

          stream_chart1.xAxis.tickFormat (d) ->
            d3.time.format("%x") new Date(d)

          stream_chart1.yAxis.tickFormat d3.format("d")
          d3.select("#stream_chart1 svg").datum(abc).call stream_chart1
          nv.utils.windowResize stream_chart1.update
          stream_chart1


      _renderHashtags: ->
        data = @data.hashtag_output
        nv.addGraph ->
          stream_chart2 = nv.models.stackedAreaChart().margin(right: 100).x((d) ->
            d[0]
          ).y((d) ->
            d[1]
          ).useInteractiveGuideline(true).rightAlignYAxis(true).transitionDuration(500).showControls(true).clipEdge(true)
          stream_chart2.xAxis.tickFormat (d) ->
            d3.time.format("%x") new Date(d)
          stream_chart2.yAxis.tickFormat d3.format("d")
          d3.select("#stream_chart2 svg").datum(data).call stream_chart2
          nv.utils.windowResize stream_chart2.update
          stream_chart2

      _renderUserMentions: ->
        data = @data.user_mentions_output
        nv.addGraph ->
          stream_chart3 = nv.models.stackedAreaChart().margin(right: 100).x((d) ->
            d[0]
          ).y((d) ->
            d[1]
          ).useInteractiveGuideline(true).rightAlignYAxis(true).transitionDuration(500).showControls(true).clipEdge(true)
          stream_chart3.xAxis.tickFormat (d) ->
            d3.time.format("%x") new Date(d)
          stream_chart3.yAxis.tickFormat d3.format("d")
          d3.select("#stream_chart3 svg").datum(data).call stream_chart3
          nv.utils.windowResize stream_chart3.update
          stream_chart3

  WVA.TwitterAnalysisSubApp