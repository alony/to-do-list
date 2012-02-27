WishesRails.Views.Wishes ||= {}

class WishesRails.Views.Wishes.IndexView extends Backbone.View
  template: JST["backbone/templates/wishes/index"]

  initialize: () ->
    @options.wishes.bind('reset', @addAll)

  addAll: () =>
    @options.wishes.each(@addOne)

  addOne: (wish) =>
    view = new WishesRails.Views.Wishes.WishView({model : wish})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(wishes: @options.wishes.toJSON() ))
    @addAll()

    return this
