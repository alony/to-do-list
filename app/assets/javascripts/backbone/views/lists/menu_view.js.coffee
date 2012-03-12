ToDoList.Views.Lists ||= {}

class ToDoList.Views.Lists.MenuView extends Backbone.View
  template: JST["backbone/templates/lists/menu"]

  addOne: (list) =>
    @template(list: list)

  render: =>
    $(@el).html(_.map(@options.lists, @addOne).join(''))

    return this
    
    
