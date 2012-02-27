WishesRails.Views.Wishes ||= {}

class WishesRails.Views.Wishes.WishView extends Backbone.View
  template: JST["backbone/templates/wishes/wish"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
