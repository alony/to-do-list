module ApplicationHelper
  def projects_list
    return link_to("Add project", new_project_path) unless current_user.projects.any?
    current_user.projects.map do |project| 
      link_to project.name, project
    end.join("<div class='breadcrumb_divider'></div>")
  end
  
  def task_lists(project)
    return unless project
    project.lists.map {|list| "<li class='icn_categories'>" << link_to(list.name, list) << "<\li>"}.join
  end
end
