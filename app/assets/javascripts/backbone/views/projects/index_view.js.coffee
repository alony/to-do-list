ToDoList.Views.Projects ||= {}

class ToDoList.Views.Projects.IndexView extends Backbone.View
  template: JST["backbone/templates/projects/index"]

  initialize: () ->
    @options.projects.bind('reset', @render)

  render: =>
    $(@el).html(@template(projects: @options.projects ))

    return this
