ToDoList.Views.Lists ||= {}

class ToDoList.Views.Lists.NewView extends Backbone.View
  template: JST["backbone/templates/lists/form"]

  events:
    "submit #new-list": "save"

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
      success: (list) =>
        window.location.hash = "/#{list.id}"

      error: (list, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template($.extend(@model.toJSON(), {action_name: "new"}) ))
    this.$("form").backboneLink(@model)

    return this
