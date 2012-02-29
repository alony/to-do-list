ToDoList.Views.Projects ||= {}

class ToDoList.Views.Projects.EditView extends Backbone.View
  template : JST["backbone/templates/projects/form"]

  events :
    "submit #edit-project" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (project) =>
        @model = project
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template($.extend(@model.toJSON(), {action_name: "edit"})))

    this.$("form").backboneLink(@model)

    return this
