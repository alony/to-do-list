ToDoList.Views.Projects ||= {}

class ToDoList.Views.Projects.MenuView extends Backbone.View
  template: JST["backbone/templates/projects/menu"]

  initialize: ->
    @options.projects.bind('reset', @render)

  render: =>
    $(@el).html(@template(projects: @options.projects ))

    return this
