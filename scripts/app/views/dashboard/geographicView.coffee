define (require) ->
  WVA = require 'WVA'
  layoutTpl = 'dashboard/sub_views/geographic/layout'
  chartsTpl = 'dashboard/sub_views/geographic/charts'
  require 'cs!entities/seeds/geographicTempData'

  WVA.module 'GeographicSubApp', (
    SubApp, WVA, Backbone, Marionette, $, _
  ) ->

    class SubApp.Layout extends Marionette.Layout
      className: 'geographics'
      template: WVA.template layoutTpl

      regions:
        subChartRegion: '.chart-container'

    class SubApp.SubView extends Marionette.ItemView
      template: WVA.template chartsTpl

      onShow: ->
        @_renderByStateDataTable()
        @_buildProfileDistributionData()

      _renderByStateDataTable: ->
        $('#states_table').DataTable
          "order": [[ 1, "desc" ]]
          "ordering": true
          "search": true
          "pageLength": 50
          fnInitComplete: ->
            $('#states_table_paginate ul').addClass('pagination pagination-sm remove-margin')
            $('#states_table_length select').addClass 'form-control input-sm'
            $('input[aria-controls="states_table"]').addClass 'form-control input-sm'

      _buildProfileDistributionData: ->
        distroData = WVA.request('geographic:temp:data', @model.get('state_counts'))
        @_renderProfileDistribution distroData

      _renderProfileDistribution: (statesData) ->
        getColor = (d) ->
          (if d > 1000 then "#800026" else (if d > 500 then "#BD0026" else (if d > 200 then "#E31A1C" else (if d > 100 then "#FC4E2A" else (if d > 50 then "#FD8D3C" else (if d > 20 then "#FEB24C" else (if d > 10 then "#FED976" else "#FFEDA0")))))))
        style = (feature) ->
          weight: 2
          opacity: 1
          color: "white"
          dashArray: "3"
          fillOpacity: 0.7
          fillColor: getColor(feature.properties.density)

        highlightFeature = (e) ->
          layer = e.target
          layer.setStyle
            weight: 5
            color: "#666"
            dashArray: ""
            fillOpacity: 0.7

          layer.bringToFront()  if not L.Browser.ie and not L.Browser.opera
          info.update layer.feature.properties

        resetHighlight = (e) ->
          geojson.resetStyle e.target
          info.update()

        zoomToFeature = (e) ->
          map.fitBounds e.target.getBounds()
          
        onEachFeature = (feature, layer) ->
          layer.on
            mouseover: highlightFeature
            mouseout: resetHighlight
            click: zoomToFeature

        map = L.map("social_profiles_map").setView([
          50
          -100
        ], 3)
        layer = L.tileLayer("https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png",
          maxZoom: 18
          attribution: "Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a> contributors, " + "<a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, " + "Imagery © <a href=\"http://mapbox.com\">Mapbox</a>"
          id: "examples.map-20v6611k"
        ).addTo map
        info = L.control()
        info.onAdd = (map) ->
          @_div = L.DomUtil.create("div", "info")
          @update()
          @_div

        info.update = (props) ->
          @_div.innerHTML = ((if props then "<b>" + props.name + "</b><br />" + props.density + " profiles" else "Hover over a state"))
        info.addTo map

        geojson = L.geoJson(statesData,
          style: style
          onEachFeature: onEachFeature
        ).addTo(map)

        legend = L.control(position: "bottomright")
        legend.onAdd = (map) ->
          div = L.DomUtil.create("div", "info legend")
          grades = [
            0
            10
            20
            50
            100
            200
            500
            1000
          ]
          labels = []
          from = undefined
          to = undefined
          i = 0

          while i < grades.length
            from = grades[i]
            to = grades[i + 1]
            labels.push "<i style=\"background:" + getColor(from + 1) + "\"></i> " + from + ((if to then "&ndash;" + to else "+"))
            i++
          div.innerHTML = labels.join("<br>")
          div

        legend.addTo map

  WVA.GeographicSubApp