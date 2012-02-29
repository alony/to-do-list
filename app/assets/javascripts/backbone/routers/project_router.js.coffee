class ToDoList.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new ToDoList.Collections.ProjectsCollection()
    @projects.reset options.projects
    @menu()

  routes:
    "/new"      : "newProject"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"
    
  newProject: ->
    @view = new ToDoList.Views.Projects.NewView(collection: @projects)
    $("#main").html(@view.render().el)

  menu: ->
    @view = new ToDoList.Views.Projects.MenuView(projects: @projects)
    $(".breadcrumbs_container").html(@view.render().el)

  show: (id) ->
    project = @projects.get(id)


  edit: (id) ->
    project = @projects.get(id)

    @view = new ToDoList.Views.Projects.EditView(model: project)
    $("#main").html(@view.render().el)
