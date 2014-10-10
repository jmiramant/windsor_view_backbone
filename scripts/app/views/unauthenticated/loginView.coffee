define (require) ->
  WVA = require "WVA"
  layoutTpl =  "unauthenticated/login_layout"
  require 'cs!config/env'
  require 'firebase'
  require 'firebase-login'

  WVA.module "LoginApp.Show", (
    Show, WVA, Backbone, Marionette, $, _
  ) ->

    class Show.Layout extends Marionette.Layout
      template: WVA.template layoutTpl
      id: "index-layout"
      events:
        'submit #form-login' : '_loginRequest'

      ui:
        emailField : '#login-email'
        passField : '#login-password'
        remember : '#login-remember-me'
        reminder : '#link-reminder-login'

      onShow: ->
        WVA.trigger 'full:view:toggle', 'full'
        @ui.reminder.hide()

      _loginRequest: (e) ->
        e.preventDefault()
        @trigger 'auth:request',
          user:
            email: @ui.emailField.val()
            password: @ui.passField.val()
  WVA.LoginApp.Show
