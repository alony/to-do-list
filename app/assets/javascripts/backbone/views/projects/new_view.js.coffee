ToDoList.Views.Projects ||= {}

class ToDoList.Views.Projects.NewView extends Backbone.View
  template: JST["backbone/templates/projects/form"]

  events:
    "submit #new-project": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (project) =>
        $(".breadcrumb_divider.new").before(ToDoList.Models.Project.menu_divider).before(project.menu_item())
        window.location.hash = "/#{project.id}"

      error: (project, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template($.extend(@model.toJSON(), {action_name: "new"}) ))

    $(".breadcrumbs_container a").removeClass("current")
    this.$("form").backboneLink(@model)

    return this
