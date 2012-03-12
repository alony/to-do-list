ToDoList.Views.Lists ||= {}

class ToDoList.Views.Lists.ShowView extends Backbone.View
  template: JST["backbone/templates/lists/menu"]

  render: =>
    $(@el).html('')

    return this
    
    
