ToDoList.Views.Lists ||= {}

class ToDoList.Views.Lists.EditView extends Backbone.View
  template : JST["backbone/templates/lists/form"]

  events :
    "submit #edit-list" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (project) =>
        @model = project
        window.location.hash = "/lists/#{@model.id}"
    )

  render : ->
    $(@el).html(@template($.extend(@model.toJSON(), {action_name: "edit"})))

    this.$("form").backboneLink(@model)

    return this
