define (require) ->
  WVA = require "WVA"
  require "cs!config/env"

  WVA.module "Entities", (
    Entities, WVA, Backbone, Marionette, $, _
  ) ->

    class Entities.Company extends Backbone.Model

    class Entities.Overview extends Backbone.Model
      defaults:
        total_emails_processed : ''
        email_providers_chart : new Array()
        email_tlds_chart : new Array()
        percent_emails_with_data : ''
        avg_profiles_per_email : ''
        num_social_networks : ''
        overlaps : new Array()
        hist_social_networks : new Array()
        sets : new Array()
        gender_count : new Array()

    class Entities.Geographics extends Backbone.Model
      defaults:
        state_counts : new Array()
        state_counts_list : new Array()

    class Entities.Professional extends Backbone.Model
      defaults:
        li_profiles : new Array()

    # class Entities.Demographics extends Backbone.Model
    #   defaults:
    #     gender_count : new Array()
    #     profile_images : new Array()
    #     male_age_ranges : new Array()
    #     female_age_ranges : new Array()

    class Entities.TwitterOverview extends Backbone.Model
      defaults:
        lifetime_tweets : ''
        total_followers : ''
        twitter_stats : new Array()
        num_twitter_profiles : ''
        total_lists : ''
        fifty_plus_followers : ''
        total_verified_users : ''
        max_lists : ''
        avg_num_followers : ''
        active_within_180_days : ''
        most_active_chart : new Array()
        most_followers_chart : new Array()
        most_lists_chart : new Array()
        max_followers : ''

    class Entities.TwitterProfiles extends Backbone.Model
      defaults:
        twitter_stats : new Array()

    class Entities.TwitterAnalysis extends Backbone.Model
      defaults:
        twitter_analytics : new Array()

    API =

      _companyData: ->
        if WVA.currentUser().companyName? then @_fetch() else @_setCompany()

      _setCompany: ->
        companyRef = new Firebase(WVA.ENV('firebaseURL') + 'users/' + WVA.currentUser().md5_hash + '/company')
        companyRef.on 'value', (snapshot) =>
          companyName = 'data_v2' #snapshot.val()
          WVA.updateUserValue 'companyName', 'data_v2' #snapshot.val()
          @_fetch()

      _fetch: ->
        dataRef = new Firebase(WVA.ENV('firebaseURL') + 'data_v2')
        dataRef.on 'value', (data) =>
          @_companyBuilder data.val()

      _companyBuilder: (data) ->
        @_initCompanyDataStruct()
        @_dataParser data

      _initCompanyDataStruct: ->
        @company = new Entities.Company()
        @struct = [(-> new Entities.Overview()),
          (-> new Entities.Geographics()),
          (-> new Entities.Professional()),
          (-> new Entities.TwitterOverview()),
          (-> new Entities.TwitterProfiles()),
          (-> new Entities.TwitterAnalysis())]

      _dataParser: (@data) ->
        _.each @struct, (fn, i) ->
          @model = fn()
          _.each @model.toJSON(), (v, k) ->
            @model.set k, @data[k]
          , @
          @company.set @model.constructor.name, @model
        , @
        @_resovleCompany()

      _resovleCompany: ->
        @defer.resolve @company

      getCompany: ->
        @defer = $.Deferred()
        @_companyData()
        @defer.promise()

    WVA.reqres.setHandler "company:entity", ->
      API.getCompany()
