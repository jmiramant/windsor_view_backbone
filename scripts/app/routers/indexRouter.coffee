define [
	"WVA"
	], (
		WVA
	) ->

  WVA.module "Routers.Unauthenticated", (
  	Unauthenticated, WVA, Backbone, Marionette, $, _
  ) ->

    class Unauthenticated.Router extends Marionette.AppRouter
      appRoutes:
        "/": 'showSplash'
        '/login' : "showLogin"
        'logout' : "Logout"

    Path =
      showSplash: ->
        require ["cs!controllers/unauthenticated/indexController"], (SplashController) ->
          new SplashController()

      showLogin: ->
        require ["cs!controllers/unauthenticated/loginController"], (LoginController) ->
          new LoginController()
      
      Logout: -> 
        WVA.trigger 'logout'

    WVA.addInitializer ->
      new Unauthenticated.Router
        controller: Path

    WVA.on "show:index", ->
      Path.showSplash()
      @navigate '/'

    WVA.on "show:login", ->
      Path.showLogin()
      @navigate '/login'

  WVA.Unauthenticated