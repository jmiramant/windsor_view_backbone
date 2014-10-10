define (require) ->
  WVA = require "cs!WVA"

  WVA.uriParser = (target) ->
    switch target
      when 'dash_menu', 'dashboard', 'overview' then { nav: 'overview', path: 'overviewView', data: 'Overview' }
      when 'demo_menu', 'demographic' then { nav: 'demographic', path: 'demographicView', data: 'Demographics' }
      when 'prof_menu', 'linkedin', 'professional' then { nav: 'professional', path: 'professionalView', data: 'Professional' }
      when 'geog_menu', 'geographic' then { nav: 'geographic', path: 'geographicView', data: 'Geographics' }
      when 'twitter_overview_menu', "twitter/overview" then { nav: 'twitter/overview', path: 'twitter/OverviewView', data: 'TwitterOverview' }
      when 'twitter_profiles_menu', "twitter/profiles" then { nav: 'twitter/profiles', path: 'twitter/ProfilesView', data: 'TwitterProfiles' }
      when 'twitter_analysis_menu', "twitter/analysis" then { nav: 'twitter/analysis', path: 'twitter/AnalysisView', data: 'TwitterAnalysis' }
      else
        { nav: 'overview', data: 'dashboard' }

  WVA.sidebarParser = (target) ->
    switch target
      when 'dashboard', 'overview' then 'dash_menu'
      when 'demographic' then 'demo_menu'
      when 'linkedin', 'professional' then 'prof_menu'
      when 'twitter/profiles' then 'twitter_profiles_menu'
      when 'twitter/analysis' then 'twitter_analysis_menu'
      when 'twitter/overview' then 'twitter_overview_menu'
