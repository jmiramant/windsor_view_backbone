define (require) ->
  WVA = require 'WVA'
  layoutTpl = 'dashboard/sub_views/twitter/profiles/layout'
  chartTpl = 'dashboard/sub_views/twitter/profiles/charts'
  require 'tabletools'

  WVA.module 'TwitterProfilesSubApp', (
    SubApp, WVA, Backbone, Marionette, $, _
  ) ->

    class SubApp.Layout extends Marionette.Layout
      className: 'twitter twitter-profiles'
      template: WVA.template layoutTpl
      # getTemplate: ->
      #   Handlebars.compile @model.get('template')

      regions:
        subChartRegion: '.chart-container'

    class SubApp.SubView extends Marionette.ItemView
      template: WVA.template chartTpl
      className: 'twitter twitter-profiles'

      onShow: ->
        @_renderProfilesTable()

      _renderProfilesTable: ->
        TableTools.DEFAULTS.sSwfPath = '//cdn.datatables.net/tabletools/2.2.1/swf/copy_csv_xls_pdf.swf'
        TableTools.DEFAULTS.aButtons = [
          "copy"
          "csv"
          "xls"
        ]
        $("#customers_table").DataTable
          order: [[
            3
            "desc"
          ]]
          columnDefs: [
            targets: [1]
            visible: false
            searchable: false
          ]
          ordering: true
          search: true
          fnInitComplete: ->
            $('#customers_table_paginate ul').addClass('pagination pagination-sm remove-margin')
            $('#customers_table_length select').addClass 'form-control input-sm'
            $('input[aria-controls="customers_table"]').addClass 'form-control input-sm'
          pageLength: 25
          sDom: "T<'row'><'row'<'col-sm-6 col-xs-5'l><'col-sm-6 col-xs-7'f>r>t<'row'<'col-sm-5 hidden-xs'i><'col-sm-7 col-xs-12 clearfix'p>>"
          sPaginationType: "bootstrap"
          oLanguage:
            sLengthMenu: "_MENU_"
            sSearch: "<div class=\"input-group\">_INPUT_<span class=\"input-group-addon\"><i class=\"fa fa-search\"></i></span></div>"
            sInfo: "<strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>"
            oPaginate:
              sPrevious: ""
              sNext: ""


      templateHelpers: -> 
        Handlebars.registerHelper 'setClass', (options) -> 
          resp = ''
          if @active
            resp = resp + 'warning ' if @verified
            resp = resp + 'success' if @contributors_enabled
            resp
          else 
            ''
        Handlebars.registerHelper 'verifiedIcon', (options) -> 
          if @verified then options.fn() else options.inverse()

        Handlebars.registerHelper 'contributorsIcon', (options) -> 
          if @contributors_enabled then options.fn() else options.inverse()

        Handlebars.registerHelper 'ratio', -> 
          ((@followers_count/@friends_count)*100).toFixed(1)

  WVA.TwitterProfilesSubApp