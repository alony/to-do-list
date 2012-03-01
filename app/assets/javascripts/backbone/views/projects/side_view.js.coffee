ToDoList.Views.Projects ||= {}

class ToDoList.Views.Projects.SideView extends Backbone.View

  template: JST["backbone/templates/projects/side"]

  render: ->
    $(@el).html(@template(project: @model, owner: true))

    return this
