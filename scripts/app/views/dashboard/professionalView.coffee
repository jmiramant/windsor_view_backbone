define (require) ->
  WVA = require 'WVA'
  require 'tabletools'
  layoutTpl = 'dashboard/sub_views/professional/layout'
  chartTpl = 'dashboard/sub_views/professional/chart'

  WVA.module 'ProfessionalSubApp', (
    SubApp, WVA, Backbone, Marionette, $, _
  ) ->

    class SubApp.Layout extends Marionette.Layout
      className: 'professional'
      template: WVA.template layoutTpl

      regions:
        subChartRegion: '.chart-container'

    class SubApp.SubView extends Marionette.ItemView
      template: WVA.template chartTpl

      onShow: ->
        @_renderDataTable()

      _renderDataTable: ->
        TableTools.DEFAULTS.sSwfPath = '//cdn.datatables.net/tabletools/2.2.1/swf/copy_csv_xls_pdf.swf'
        TableTools.DEFAULTS.aButtons = [
          "copy"
          "csv"
          "xls"
        ]
        $("#li_summary_table").DataTable
          order: [[
            0
            "asc"
          ]]
          columnDefs: [
            targets: [1]
            visible: false
            searchable: false
          ]
          ordering: true
          search: true
          pageLength: 25
          fnInitComplete: ->
            $('#li_summary_table_paginate ul').addClass('pagination pagination-sm remove-margin')
            $('#li_summary_table_length select').addClass 'form-control input-sm'
            $('input[aria-controls="li_summary_table"]').addClass 'form-control input-sm'
          sDom: "T<'row'><'row'<'col-sm-6 col-xs-5'l><'col-sm-6 col-xs-7'f>r>t<'row'<'col-sm-5 hidden-xs'i><'col-sm-7 col-xs-12 clearfix'p>>"
          oPagination: "bootstrap"
          oLanguage:
            sLengthMenu: "_MENU_"
            sSearch: "<div class=\"input-group\">_INPUT_<span class=\"input-group-addon\"><i class=\"fa fa-search\"></i></span></div>"
            sInfo: "<strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>"
            oPaginate:
              sPrevious: ""
              sNext: ""


  WVA.ProfessionalSubApp