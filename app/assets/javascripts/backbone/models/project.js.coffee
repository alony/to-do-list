class ToDoList.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults: {name: ''}
  
  menu_item: =>
    "<a href='#/#{@id}' id='#{@id}'>#{@get('name')}</a>"
  
  @menu_divider: "<div class='breadcrumb_divider'></div>"
    
class ToDoList.Collections.ProjectsCollection extends Backbone.Collection
  model: ToDoList.Models.Project
  url: '/projects'
