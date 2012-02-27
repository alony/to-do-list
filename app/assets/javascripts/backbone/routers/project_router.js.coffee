class ToDoList.Routers.TasksRouter extends Backbone.Router
  initialize: (options) ->
    @tasks = new ToDoList.Collections.TasksCollection()
    @tasks.reset options.tasks

  routes:
    "/new"      : "newTask"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"
    
  newTask: ->
    @view = new ToDoList.Views.Tasks.NewView(collection: @tasks)
    $("#tasks").html(@view.render().el)

  index: ->
    @view = new ToDoList.Views.Tasks.IndexView(tasks: @tasks)
    $("#tasks").html(@view.render().el)

  show: (id) ->
    wish = @tasks.get(id)

    @view = new ToDoList.Views.Tasks.ShowView(model: task)
    $("#tasks").html(@view.render().el)

  edit: (id) ->
    task = @tasks.get(id)

    @view = new ToDoList.Views.Tasks.EditView(model: task)
    $("#tasks").html(@view.render().el)
