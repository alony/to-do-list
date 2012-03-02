ToDoList.Views.Lists ||= {}

class ToDoList.Views.Lists.MenuView extends Backbone.View
  template: JST["backbone/templates/lists/menu"]

  initialize: ->
    @options.lists.bind('reset', @render)

  render: =>
    $(@el).html(@template(lists: @options.lists ))

    return this
