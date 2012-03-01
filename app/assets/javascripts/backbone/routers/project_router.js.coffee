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
    $(".breadcrumbs_container a").removeClass("current").filter("##{id}").addClass("current")
    @view = new ToDoList.Views.Projects.SideView(model: @projects.get(id))
    $("aside#sidebar").html(@view.render().el)

  edit: (id) ->
    project = @projects.get(id)

    @view = new ToDoList.Views.Projects.EditView(model: project)
    $("#main").html(@view.render().el)
    
  index: ->
    @menu()
    if @projects.length == 0 
      @newProject()
    else
      @show(@projects.at(0).id)
