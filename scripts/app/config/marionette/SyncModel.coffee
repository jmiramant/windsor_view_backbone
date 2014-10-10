define ["marionette", 'backbone'], (Marionette, Backbone) ->

  Backbone.Model.Sync = Backbone.Model.extend(
    
    _modelToJSON = Backbone.Model.prototype.toJSON
    _modelSync = Backbone.Model.prototype.sync

    sync: ( method, model, options ) ->
      options.persistData = true
      _modelSync.call @, method, model, options

    toJSON: (options) ->
      data = opts = options || {}
      data = if opts.persistData
        {user: _modelToJSON.call(this, options)}
      else
        _modelToJSON.call @, options
      data

  )

  Backbone.Model.Sync