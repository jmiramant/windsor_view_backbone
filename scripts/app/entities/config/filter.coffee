define ["cs!WVA"], (WVA) ->
  WVA.module "Entities", (Entities, WVA, Backbone, Marionette, $, _) ->
    
    Entities.FilteredCollection = (options) ->
      original = options.collection
      filtered = new original.constructor()
      filtered.add original.models
      filtered.filterFunction = options.filterFunction
      
      applyFilter = (filterCriterion, filterStrategy, collection) ->
        collection = collection or original
        criterion = undefined
        if filterStrategy is "filter"
          criterion = filterCriterion.trim()
        else
          criterion = filterCriterion
        items = []
        if criterion
          if filterStrategy is "filter"
            throw ("Attempted to use 'filter' function, but none was defined")  unless filtered.filterFunction
            filterFunction = filtered.filterFunction(criterion)
            items = collection.filter(filterFunction)
          else
            items = collection.where(criterion)
        else
          items = collection.models
        filtered._currentCriterion = criterion
        items

      filtered.filter = (filterCriterion) ->
        filtered._currentFilter = "filter"
        items = applyFilter(filterCriterion, "filter")
        filtered.reset items
        filtered

      filtered.where = (filterCriterion) ->
        filtered._currentFilter = "where"
        items = applyFilter(filterCriterion, "where")
        filtered.reset items
        filtered      
      original.on "reset", ->
        items = applyFilter(filtered._currentCriterion, filtered._currentFilter)
        filtered.reset items
        coll = new original.constructor()
        coll.add models
        items = applyFilter(filtered._currentCriterion, filtered._currentFilter, coll)
        filtered.add items

      filtered

  WVA.Entities.FilteredCollection