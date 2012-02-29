class ToDoList.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new ToDoList.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    "/new"      : "newProject"
    "/index"    : "index"
    "/edit" : "edit"
    "/:id"      : "show"
    ".*"       : "index"
    
  newProject: ->
    @view = new ToDoList.Views.Projects.NewView(collection: @projects)
    $("#main").html(@view.render().el)

  index: ->
    @view = new ToDoList.Views.Projects.IndexView(projects: @projects)
    $(".breadcrumbs_container").html(@view.render().el)

  show: (id) ->
    project = @projects.get(id)


  edit: (id) ->
    project = @projects.get(id)

    @view = new ToDoList.Views.Projects.EditView(model: project)
    $("#main").html(@view.render().el)
