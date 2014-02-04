@MarionetteSSE.module "LogApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends Marionette.Controller
    initialize: (options) ->
      @layout = @getLayout()
      @firstTypeCollection = new App.Models.Log.Collection
      @secondTypeCollection = new App.Models.Log.Collection
      @layout.on "show", =>
        @layout.typeOne.show @getLogListView(@firstTypeCollection)
        @layout.typeTwo.show @getLogListView(@secondTypeCollection)

      App.getRegion("mainRegion").show @layout

      @listenTo @, "log:updated", (data) =>
        collection = @collectionByData(data)
        collection.add new App.Models.Log.Item
          data: data

      @startListening()

    getLayout: ->
      new Show.LogListLayout

    getLogListView: (collection) ->
      new Show.LogList(collection: collection)

    startListening: ->
      source = new EventSource("/stream")
      source.onmessage = (e) =>
        @trigger "log:updated", e.data

    collectionByData: (data) ->
      if data.indexOf("ERROR") != -1
        @firstTypeCollection
      else
        @secondTypeCollection
