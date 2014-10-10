define (require) ->
  WVA = require "WVA"
  require 'cs!common/uriParser'
  sidebarTpl = "persistent/sidebar/layout"

  WVA.module "PersistentApp.Show" , (
    Show, GMA, Backbone, Marionette, $, _
  ) ->

    class Show.Sidebar extends Marionette.ItemView
      template: WVA.template sidebarTpl
      events:
        'click a' : '_navigate'
      ui:
        twitterSubMenu: '#twitter_data_menu'

      onRender: ->
        @_unwrap()

      onShow: ->
        @_handleSidebar 'init'

      _unwrap: ->
        @$el = @$el.children()
        @$el.unwrap()
        @setElement @$el

      _setActiveState: (link) ->
        $('.sidebar-nav a').removeClass 'active'
        link.addClass 'active'

      _navigate: (e) ->
        link = $(e.currentTarget)
        target = link.attr('id') 
        @_setActiveState link unless target is 'twitter_parent'
        switch target
          when 'twitter_parent' then @_toggleTwitterMenu $(e.currentTarget)
          else
            @trigger 'navigate', target

      updateActiveState: (target) ->
        $('.sidebar-nav a').removeClass 'active'
        $('#' + target).addClass 'active'

      _toggleTwitterMenu: (t) ->
        close = =>
          t.removeClass 'open'
          @ui.twitterSubMenu.slideUp()
        open = =>
          t.addClass 'open'
          @ui.twitterSubMenu.slideDown()
        if t.hasClass 'open' then close() else open()

      toggleSidebar: ->
        action = if @sidebarState is 'closed' then 'open-sidebar' else 'close-sidebar'
        @$el.removeClass()
        @$el.addClass action
        @_handleSidebar action
        @sidebarState = if @sidebarState is 'closed' then 'open' else 'closed'

      initialize: ->
        @sidebarState = 'open'
        @page            = $('#page-container');
        @pageContent     = $('#main-container');
        @header          = $('header');
        @sidebar         = $('#sidebar');
        @sidebarAlt      = $('#sidebar-alt');
        @sScroll         = $('.sidebar-scroll');

      _handleSidebar: (mode, extra) ->
        sidebarScrollResize = ->
          @sScroll.add(@sScroll.parent()).css "height", $(window).height()
        sidebarScrollResizeOrient = ->
          setTimeout @sScroll.add(@sScroll.parent()).css("height", $(window).height()), 500

        if mode is "init"
          handleSidebar "sidebar-scroll"  if @header.hasClass("navbar-fixed-top") or @header.hasClass("navbar-fixed-bottom")
          $(".sidebar-partial #sidebar").mouseenter =>
            @_handleSidebar "open-sidebar"
          $(".sidebar-partial #sidebar").mouseleave =>
            @_handleSidebar "close-sidebar" if @sidebarState is 'closed'
          $(".sidebar-alt-partial #sidebar-alt").mouseenter =>
            @_handleSidebar "close-sidebar"
        else
          windowW = window.innerWidth or document.documentElement.clientWidth or document.body.clientWidth
          if mode is "toggle-sidebar"
            if windowW > 991
              @page.toggleClass "sidebar-visible-lg"
              @_handleSidebar "close-sidebar-alt"  if @page.hasClass("sidebar-visible-lg")
              # If 'toggle-other' is set, open the alternative sidebar when we close this one
              @_handleSidebar "open-sidebar-alt"  unless @page.hasClass("sidebar-visible-lg")  if extra is "toggle-other"
            else # Toggle main sidebar in small screens (< 992px)
              @page.toggleClass "sidebar-visible-xs"
              @_handleSidebar "close-sidebar-alt"  if @page.hasClass("sidebar-visible-xs")
          else if mode is "toggle-sidebar-alt"
            if windowW > 991 # Toggle alternative sidebar in large screens (> 991px)
              @page.toggleClass "sidebar-alt-visible-lg"
              @_handleSidebar "close-sidebar"  if @page.hasClass("sidebar-alt-visible-lg")
              # If 'toggle-other' is set open the main sidebar when we close the alternative
              @_handleSidebar "open-sidebar"  unless @page.hasClass("sidebar-alt-visible-lg")  if extra is "toggle-other"
            else # Toggle alternative sidebar in small screens (< 992px)
              @page.toggleClass "sidebar-alt-visible-xs"
              @_handleSidebar "close-sidebar"  if @page.hasClass("sidebar-alt-visible-xs")
          else if mode is "open-sidebar"
            if windowW > 991 # Open main sidebar in large screens (> 991px)
              @page.addClass "sidebar-visible-lg"
            else # Open main sidebar in small screens (< 992px)
              @page.addClass "sidebar-visible-xs"
            # Close the other sidebar
            @_handleSidebar "close-sidebar-alt"
          else if mode is "open-sidebar-alt"
            if windowW > 991 # Open alternative sidebar in large screens (> 991px)
              @page.addClass "sidebar-alt-visible-lg"
            else # Open alternative sidebar in small screens (< 992px)
              @page.addClass "sidebar-alt-visible-xs"
            # Close the other sidebar
            @_handleSidebar "close-sidebar"
          else if mode is "close-sidebar"
            if windowW > 991 # Close main sidebar in large screens (> 991px)
              @page.removeClass "sidebar-visible-lg"
            else # Close main sidebar in small screens (< 992px)
              @page.removeClass "sidebar-visible-xs"
          else if mode is "close-sidebar-alt"
            if windowW > 991 # Close alternative sidebar in large screens (> 991px)
              @page.removeClass "sidebar-alt-visible-lg"
            else # Close alternative sidebar in small screens (< 992px)
              @page.removeClass "sidebar-alt-visible-xs"
          else if mode is "sidebar-scroll" # Init sidebars scrolling
            if @sScroll.length and (not @sScroll.parent(".slimScrollDiv").length)
              # Initialize Slimscroll plugin on both sidebars
              @sScroll.slimScroll
                height: $(window).height()
                color: "#fff"
                size: "3px"
                touchScrollStep: 100
              # Resize sidebars scrolling height on window resize or orientation change
              $(window).resize sidebarScrollResize
              $(window).bind "orientationchange", sidebarScrollResizeOrient
        false