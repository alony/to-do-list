class ToDoList.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new ToDoList.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    "projects/new"      : "newTask"
    "projects/index"    : "index"
    "projects/:id/edit" : "edit"
    "projects/:id"      : "show"
    "projects"          : "index"
    
  newTask: ->
    @view = new ToDoList.Views.Projects.NewView(collection: @projects)
    $("#tasks").html(@view.render().el)

  index: ->
    @view = new ToDoList.Views.Projects.IndexView(tasks: @projects)
    $("#tasks").html(@view.render().el)

  show: (id) ->
    wish = @projects.get(id)

    @view = new ToDoList.Views.Projects.ShowView(model: project)
    $("#tasks").html(@view.render().el)

  edit: (id) ->
    project = @projects.get(id)

    @view = new ToDoList.Views.Projects.EditView(model: project)
    $("#tasks").html(@view.render().el)
