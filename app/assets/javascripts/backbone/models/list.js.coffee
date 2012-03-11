class ToDoList.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults: { name: '', desc: '' }

class ToDoList.Collections.ListsCollection extends Backbone.Collection
  model: ToDoList.Models.List
  
  url: ->
    "/lists"

