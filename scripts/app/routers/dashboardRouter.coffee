define (require) -> 
  WVA = require "WVA"

  WVA.module "Routers.Dashboard", (
    Dashboard, WVA, Backbone, Marionette, $, _
  ) ->

    class Dashboard.Router extends Marionette.AppRouter
      appRoutes:
        "dashboard/:subview": 'showDashboard'
        "dashboard/:subview/:second": 'showDashboard'

    Path =
      showDashboard: (target) ->
        subview = if target.initial
          target.initial
        else
          location.hash.replace('#dashboard/','')
        require [
          "cs!controllers/dashboardController"
        ], (
          DashboardController
        ) ->
          new DashboardController subview

    WVA.addInitializer ->
      new Dashboard.Router
        controller: Path

    WVA.on "init:dashboard", (target) ->
      nav = if target.initial then target.initial else target
      Path.showDashboard target
      @navigate '/dashboard/' + nav

    WVA.on 'nav:dashboard:subview', (target) ->
      @navigate '/dashboard/' + target

  WVA.Dashboard