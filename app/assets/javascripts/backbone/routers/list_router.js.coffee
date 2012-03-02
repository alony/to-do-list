class ToDoList.Routers.ListsRouter extends Backbone.Router
  initialize: (options) ->
    @lists = new ToDoList.Collections.ListsCollection()
    @lists.reset options.lists

  routes:
    "/:project_id/lists/new" : "newList"
    "/lists/:id/edit"        : "edit"
    "/lists/:id"             : "show"
    "/:project_id/lists"     : "index"
    
  newList: (project_id) ->
    @view = new ToDoList.Views.Lists.NewView(collection: @lists)
    $("#main").html(@view.render().el)

  menu: ->
    @view = new ToDoList.Views.Lists.ListView(lists: @lists)
    $(".breadcrumbs_container").html(@view.render().el)

  show: (id) ->
    @view = new ToDoList.Views.Lists.ShowView(model: @lists.get(id))
    $("main").html(@view.render().el)

  edit: (id) ->
    list = @lists.get(id)

    @view = new ToDoList.Views.Lists.EditView(model: list)
    $("#main").html(@view.render().el)
    
  index: ->
    @menu()
    if @lists.length == 0 
      @newList()
    else
      @show(@lists.at(0).id)
