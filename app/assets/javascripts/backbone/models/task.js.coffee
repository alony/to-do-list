class ToDoList.Models.Task extends Backbone.Model
  paramRoot: 'task'

  defaults: {title: ''}

class ToDoList.Collections.TasksCollection extends Backbone.Collection
  model: ToDoList.Models.Task
  url: '/tasks'
