@MarionetteSSE.module "LogApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.LogListLayout extends Marionette.Layout
    template: JST["backbone/apps/log/show/_templates/layout"]

    regions:
      typeOne: "#type-one"
      typeTwo: "#type-two"

  class Show.Log extends Marionette.ItemView
    template: JST["backbone/apps/log/show/_templates/log"]

  class Show.LogList extends Marionette.CollectionView
    itemView: Show.Log
