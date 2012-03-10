class ToDoList.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults: { name: '', desc: '' }

class ToDoList.Collections.ListsCollection extends Backbone.Collection
  model: ToDoList.Models.List
  
  url: (options) ->
    "/lists?project_id=#{options.project_id}"

