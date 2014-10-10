define [
  "cs!WVA"
  'cs!config/env'
  'firebase'
  'firebase-login'
], (
  WVA
) ->

  dataRef = new Firebase(WVA.ENV('firebaseURL'))
  WVA.auth = new FirebaseSimpleLogin dataRef, (error, user) ->
    if error
      clearErr = ->
        $('#error p').fadeOut ->
          $('#error').html('')
      prettyError =  error.code.replace('_', ' ').capitalize()
      $('#error').append('<p style="display:none;">' + prettyError + '</p>')
      $('#error p').fadeIn()
      _.delay clearErr, 3000
    else if user
      WVA.updateUser user
      WVA.trigger 'auth:success'
    else
      WVA.trigger 'logout'
