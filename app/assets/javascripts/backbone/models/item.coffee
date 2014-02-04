@MarionetteSSE.module "Models.Log", (Log, App, Backbone, Marionette, $, _) ->
  class Log.Item extends Backbone.Model
    defaults:
      data: "Some data"

  class Log.Collection extends Backbone.Collection
    model: Log.Item

