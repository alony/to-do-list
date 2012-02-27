WishesRails.Views.Wishes ||= {}

class WishesRails.Views.Wishes.EditView extends Backbone.View
  template : JST["backbone/templates/wishes/edit"]

  events :
    "submit #edit-wish" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (wish) =>
        @model = wish
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
