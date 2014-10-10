define (require) -> 
  WVA = require "cs!WVA"

  WVA.ENV = (key, args = null) ->
    env = switch window.location.hostname
      when "localhost", "127.0.0.1"
        "development"
      when "wv-staging.firebaseapp.com"
        "staging"
      when "windsorview.com"
        "production"

    apiHost =
      development:
        firebaseURL: 'https://wv-staging.firebaseio.com/'
        firebaseKey: "9385e00b2e9c339e5a85b94a4b24f0cd"
      
      staging:
        firebaseURL: 'https://wv-staging.firebaseio.com/'
        firebaseKey: "9385e00b2e9c339e5a85b94a4b24f0cd"

      production:
        firebaseURL: 'https://glowing-fire-8058.firebaseio.com/'
        firebaseKey: "2f44795d79ea1c8707bff791d9502362"

    apiHost[env][key]

  WVA.ENV