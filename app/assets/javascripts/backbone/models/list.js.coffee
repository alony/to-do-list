class ToDoList.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults: { name: '', desc: '' }
  
  menu_item: =>
    "<li class='icn_categories'><a href='/lists/#{@id}'>#{@get('name')}</a></li>"

class ToDoList.Collections.ListsCollection extends Backbone.Collection
  model: ToDoList.Models.List
  
  url: (options) ->
    "/lists?project_id=#{options['project_id']}"

