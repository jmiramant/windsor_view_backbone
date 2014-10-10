define [
  "jquery"
  "datatables"
], ->

  jQuery.fn.dataTableExt.oApi.fnPagingInfo = (e) ->
    iStart: e._iDisplayStart
    iEnd: e.fnDisplayEnd()
    iLength: e._iDisplayLength
    iTotal: e.fnRecordsTotal()
    iFilteredTotal: e.fnRecordsDisplay()
    iPage: Math.ceil(e._iDisplayStart / e._iDisplayLength)
    iTotalPages: Math.ceil(e.fnRecordsDisplay() / e._iDisplayLength)

  jQuery.extend(jQuery.fn.dataTableExt.oPagination,
    bootstrap:
      fnInit: (e, t, n) ->
        i = e.oLanguage.oPaginate
        r = (t) ->
          t.preventDefault()
          e.oApi._fnPageChange(e, t.data.action) and n(e)

          return

        jQuery(t).append "<ul class=\"pagination pagination-sm remove-margin\"><li class=\"prev disabled\"><a href=\"javascript:void(0)\"><i class=\"fa fa-chevron-left\"></i> " + i.sPrevious + "</a></li>" + "<li class=\"next disabled\"><a href=\"javascript:void(0)\">" + i.sNext + " <i class=\"fa fa-chevron-right\"></i></a></li>" + "</ul>"
        o = jQuery("a", t)
        jQuery(o[0]).bind("click.DT",
          action: "previous"
        , r)
        jQuery(o[1]).bind("click.DT",
          action: "next"
        , r)

        return

      fnUpdate: (e, t) ->
        n = undefined
        i = undefined
        r = undefined
        o = undefined
        a = undefined
        s = 5
        l = e.oInstance.fnPagingInfo()
        c = e.aanFeatures.p
        u = Math.floor(s / 2)
        (if l.iTotalPages < s then (o = 1
        a = l.iTotalPages
        ) else (if l.iPage <= u then (o = 1
        a = s
        ) else (if l.iPage >= l.iTotalPages - u then (o = l.iTotalPages - s + 1
        a = l.iTotalPages
        ) else (o = l.iPage - u + 1
        a = o + s - 1
        ))))
        n = 0
        iLen = c.length

        while iLen > n
          jQuery("li:gt(0)", c[n]).filter(":not(:last)").remove()
          i = o

          while a >= i
            r = (if i is l.iPage + 1 then "class=\"active\"" else "")
            jQuery("<li " + r + "><a href=\"javascript:void(0)\">" + i + "</a></li>").insertBefore(jQuery("li:last", c[n])[0]).bind("click", (n) ->
              n.preventDefault()
              e._iDisplayStart = (parseInt(jQuery("a", this).text(), 10) - 1) * l.iLength
              t(e)

              return
            )
            i++
          (if 0 is l.iPage then jQuery("li:first", c[n]).addClass("disabled") else jQuery("li:first", c[n]).removeClass("disabled"))
          (if l.iPage is l.iTotalPages - 1 or 0 is l.iTotalPages then jQuery("li:last", c[n]).addClass("disabled") else jQuery("li:last", c[n]).removeClass("disabled"))
          n++
        return
  )

  $.extend true, $.fn.dataTable.defaults,
    sDom: "<'row'<'col-sm-6 col-xs-5'l><'col-sm-6 col-xs-7'f>r>t<'row'<'col-sm-5 hidden-xs'i><'col-sm-7 col-xs-12 clearfix'p>>"
    sPaginationType: "bootstrap"
    oLanguage:
      sLengthMenu: "_MENU_"
      sSearch: "<div class=\"input-group\">_INPUT_<span class=\"input-group-addon\"><i class=\"fa fa-search\"></i></span></div>"
      sInfo: "<strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>"
      oPaginate:
        sPrevious: ""
        sNext: ""

  $.fn.dataTableExt.oApi.fnPagingInfo = (oSettings) ->
    iStart: oSettings._iDisplayStart
    iEnd: oSettings.fnDisplayEnd()
    iLength: oSettings._iDisplayLength
    iTotal: oSettings.fnRecordsTotal()
    iFilteredTotal: oSettings.fnRecordsDisplay()
    iPage: ((if oSettings._iDisplayLength is -1 then 0 else Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength)))
    iTotalPages: ((if oSettings._iDisplayLength is -1 then 0 else Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)))

  $.extend $.fn.dataTableExt.oPagination,
    bootstrap:
      fnInit: (oSettings, nPaging, fnDraw) ->
        els = undefined
        fnClickHandler = undefined
        oLang = undefined
        oLang = oSettings.oLanguage.oPaginate
        fnClickHandler = (e) ->
          e.preventDefault()
          fnDraw oSettings  if oSettings.oApi._fnPageChange(oSettings, e.data.action)

        $(nPaging).addClass("pagination").append "<ul>" + "<li class=\"prev disabled\"><a href=\"#\">&larr; " + oLang.sPrevious + "</a></li>" + "<li class=\"next disabled\"><a href=\"#\">" + oLang.sNext + " &rarr; </a></li>" + "</ul>"
        els = $("a", nPaging)
        $(els[0]).bind "click.DT",
          action: "previous"
        , fnClickHandler
        $(els[1]).bind "click.DT",
          action: "next"
        , fnClickHandler

      fnUpdate: (oSettings, fnDraw) ->
        an = undefined
        i = undefined
        iEnd = undefined
        iHalf = undefined
        iLen = undefined
        iListLength = undefined
        iStart = undefined
        j = undefined
        oPaging = undefined
        sClass = undefined
        _results = undefined
        iListLength = 5
        oPaging = oSettings.oInstance.fnPagingInfo()
        an = oSettings.aanFeatures.p
        i = undefined
        j = undefined
        sClass = undefined
        iStart = undefined
        iEnd = undefined
        iHalf = Math.floor(iListLength / 2)
        if oPaging.iTotalPages < iListLength
          iStart = 1
          iEnd = oPaging.iTotalPages
        else if oPaging.iPage <= iHalf
          iStart = 1
          iEnd = iListLength
        else if oPaging.iPage >= (oPaging.iTotalPages - iHalf)
          iStart = oPaging.iTotalPages - iListLength + 1
          iEnd = oPaging.iTotalPages
        else
          iStart = oPaging.iPage - iHalf + 1
          iEnd = iStart + iListLength - 1
        i = 0
        iLen = an.length
        _results = []
        while i < iLen
          $("li:gt(0)", an[i]).filter(":not(:last)").remove()
          j = iStart
          while j <= iEnd
            sClass = ((if j is oPaging.iPage + 1 then "class=\"active\"" else ""))
            $("<li " + sClass + "><a href=\"#\">" + j + "</a></li>").insertBefore($("li:last", an[i])[0]).bind "click", (e) ->
              e.preventDefault()
              oSettings._iDisplayStart = (parseInt($("a", this).text(), 10) - 1) * oPaging.iLength
              fnDraw oSettings
              return

            j++
          if oPaging.iPage is 0
            $("li:first", an[i]).addClass "disabled"
          else
            $("li:first", an[i]).removeClass "disabled"
          if oPaging.iPage is oPaging.iTotalPages - 1 or oPaging.iTotalPages is 0
            $("li:last", an[i]).addClass "disabled"
          else
            $("li:last", an[i]).removeClass "disabled"
          _results.push i++
        _results

  return
