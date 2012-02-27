class ToDoList.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults: {title: ''}

class ToDoList.Collections.ProjectsCollection extends Backbone.Collection
  model: ToDoList.Models.Project
  url: '/projects'
