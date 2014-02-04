@MarionetteSSE = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.addRegions
    mainRegion: "#main-region"


  App.addInitializer ->
    App.module("LogApp").start()

  App

$ =>
  @MarionetteSSE.start()
