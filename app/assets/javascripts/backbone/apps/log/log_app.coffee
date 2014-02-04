@MarionetteSSE.module "LogApp", (LogApp, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  API =
    showMain: ->
      c = new LogApp.Show.Controller()

  LogApp.on "start", ->
    API.showMain()
