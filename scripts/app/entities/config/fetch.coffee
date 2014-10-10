define ["cs!WVA"], (WVA) ->  
  
  WVA.module "Entities", (Entities, WVA, Backbone, Marionette, $, _) ->
    
    WVA.commands.setHandler "when:fetched", (entities, callback) ->
      xhrs = _.chain([entities]).flatten().pluck("_fetch").value()
      
      $.when(xhrs...).done ->
        callback()