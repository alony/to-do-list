ToDoList.Views.Projects ||= {}

class ToDoList.Views.Projects.SideView extends Backbone.View

  template: JST["backbone/templates/projects/side"]

  render: ->
    $(@el).html(@template(project: @model, owner: true))

    @lists = new ToDoList.Views.Lists.MenuView(lists: @model.get('lists'))
    $(@el).find("#lists").html(@lists.render().el)

    return this
