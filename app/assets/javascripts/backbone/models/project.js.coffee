class ToDoList.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults: {name: ''}

class ToDoList.Collections.ProjectsCollection extends Backbone.Collection
  model: ToDoList.Models.Project
  url: '/projects'
