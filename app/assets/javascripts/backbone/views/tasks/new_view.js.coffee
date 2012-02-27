WishesRails.Views.Wishes ||= {}

class WishesRails.Views.Wishes.NewView extends Backbone.View
  template: JST["backbone/templates/wishes/new"]

  events:
    "submit #new-wish": "save"

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
      success: (wish) =>
        @model = wish
        window.location.hash = "/#{@model.id}"

      error: (wish, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
