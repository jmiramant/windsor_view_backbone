define (require) ->
  Marionette = require "marionette"
  JST = require '../templates'

  WVA = new Marionette.Application()

  WVA.rootRoute = '/'

  WVA.routes = [
    'dashboard/overview'
    'dashboard/geographic'
    'dashboard/professional'
    'dashboard/demographic'
    'dashboard/twitter/overview'
    'dashboard/twitter/profiles'
    'dashboard/twitter/analytics'
  ]

  WVA.getCurrentRoute = -> Backbone.history.fragment
  WVA.currentUser = -> JSON.parse sessionStorage.getItem('current_user')
  WVA.navigate = (route, options) ->
    options or (options = {})
    Backbone.history.navigate route, options

  WVA.updateUser = (current_user = null) ->
    sessionStorage.setItem('current_user', JSON.stringify(current_user))

  WVA.updateUserValue = (key, value) ->
    currentUser = WVA.currentUser()
    if currentUser
      currentUser[key] = value
      WVA.updateUser currentUser
    else
      obj = {}
      obj[key] = value
      WVA.updateUser obj

  WVA.templates = JST
  WVA.template = (path) ->
    WVA.templates["./scripts/app/templates/#{path}.html"]

  WVA.setSessionData = (key, value) ->
    data = sessionStorage.getItem 'sessionData'
    if data
      jsonData = JSON.parse data
      jsonData.key = value
    else
      jsonData = {}
      jsonData[key] = value
    sessionStorage.setItem 'sessionData',  JSON.stringify(jsonData)

  WVA.getSessionData = (key) ->
    if sessionStorage.getItem 'sessionData'
      JSON.parse(sessionStorage.getItem 'sessionData')[key]
    else
      null

  WVA.InitUnauthentication = ->
    require [
      'cs!common/deps/unauthenticated_deps'
      'cs!config/firebaseInit'
    ], ->
      Backbone.history.start() unless Backbone.history.options
      WVA.trigger 'show:index'
      $('body').css 'padding-top', '0px'

  WVA.InitAuthentication = ->
    require [
      'cs!controllers/persistentController'
      'cs!common/deps/authenticated_deps'
      'cs!routers/dashboardRouter'
    ], (sidebarController) =>
      Backbone.history.start() unless Backbone.history.options
      new sidebarController()
      WVA.trigger 'full:view:toggle'
      WVA.trigger 'init:dashboard', {initial: 'overview'} unless location.hash.replace('#','') in WVA.routes
      $('body').css 'padding-top', '46px'

  WVA.addRegions
    mainRegion: "#main-container"
    sidebarRegion: "#sidebar-region"

  WVA.setBackDetectionHandlers = ->
    window.linkClicked = false
    window.backDetected = false
    window.previousFragment = null

  WVA.reqres.setHandler 'view:current:main', ->
    WVA.mainRegion.currentView

  WVA.on 'full:view:toggle', (action) ->
    $main = $('#main-container')
    if action is 'full'
      $main.css 'marginLeft', '0px'
    else
      $main.removeAttr 'style'

  WVA.on 'logout', (route) ->
    WVA.auth.logout()
    sessionStorage.clear()
    @_regionManager.each (region) -> region.close()
    @navigate '/'
    WVA.InitUnauthentication()

  WVA.on "initialize:before", (options) ->
    @setBackDetectionHandlers()
    require ['cs!config/base/global_handlers'], (GlobalHandlers) ->
      WVA.GlobalHandlers.initialize()

  WVA.on "initialize:after", ->
    if Backbone.history
      require ['cs!config/firebaseInit'], =>
        if WVA.currentUser()
          WVA.InitAuthentication()
        else
          WVA.InitUnauthentication()

  WVA
