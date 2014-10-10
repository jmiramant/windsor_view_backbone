define (require) ->
  WVA = require "WVA"
  require "cs!views/unauthenticated/loginView"
  require "firebase-login"

  WVA.module "LoginApp.Show", (
  	Show, WVA, Backbone, Marionette, $, _
  ) ->

    class Show.Controller extends Marionette.Controller

      initialize: ->
        @_initView()

      _initView: ->
        @layout = @_getLayoutView()
        @_layoutEvents @layout
        WVA.mainRegion.show @layout

      _layoutEvents: ->
        @listenTo @layout, 'auth:request', (formData) =>
          @_authRequest formData.user

      _authRequest: (user) ->
        WVA.on 'auth:success', => @_initAuth()
        WVA.auth.login 'password',
          email: user.email
          password: user.password

      _initAuth: ->
        companyRef = new Firebase(WVA.ENV('firebaseURL') + 'users/' + WVA.currentUser().md5_hash + '/company')
        companyRef.on 'value', (snapshot) =>
          companyName = snapshot.val()
          WVA.updateUserValue 'companyName', snapshot.val()
        @_logInUser()

      _logInUser: ->
        WVA.InitAuthentication()

      _passwordReset: (email) ->
        auth.sendPasswordResetEmail email, (error, success) ->
          if (!error)
            console.log('Password reset email sent successfully')

      _getLayoutView: ->
        new Show.Layout()

  WVA.LoginApp.Show.Controller