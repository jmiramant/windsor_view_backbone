define (require) ->
  WVA = require 'WVA'
  layoutTpl = 'dashboard/sub_views/demographic/layout'
  chartsTpl = 'dashboard/sub_views/demographic/charts'

  WVA.module 'DemographicSubApp', (
    SubApp, WVA, Backbone, Marionette, $, _
  ) ->

    class SubApp.Layout extends Marionette.Layout
      className: 'demographic'
      template: WVA.template layoutTpl

      regions:
        subChartRegion: '.chart-container'

    class SubApp.SubView extends Marionette.ItemView
      template: WVA.template chartsTpl

      ui:
        photoBook : '#photo_book'
        photoBookLoader : '.photo_book_loader'

      onRender: ->
        @_buildAgeHistogramData()

      onShow: ->
        @_renderGenderChart()
        @_renderAgeHistogram()
        @_showPhotos()

      _buildAgeHistogramData: ->
        @histoData = [
          {
            key: 'Men',
            values: @model.get('male_age_ranges')
          },
          {
            key: 'Women',
            values: @model.get('female_age_ranges')
          }
        ]

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

      _renderAgeHistogram: ->
        nv.addGraph =>
          chart3 = nv.models.multiBarChart().transitionDuration(350).reduceXTicks(false).rotateLabels(0).showControls(true).groupSpacing(0.1)
          chart3.yAxis.tickFormat d3.format("d")
          d3.select("#age_histogram svg").datum(@histoData).call chart3
          nv.utils.windowResize chart3.update
          chart3

      _showPhotos: ->
        showPhotos = =>
          @ui.photoBookLoader.fadeOut()
          @ui.photoBook.show()
        _.delay showPhotos, 3500

  WVA.DemographicSubApp