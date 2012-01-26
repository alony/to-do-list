module ApplicationHelper
  def projects_list
    projects = current_user.projects.map do |project| 
      link_to project.name, project, :class => (current_page?(project_path project) ? "current" : ''), :id => project.id, :remote => true
    end.join("<div class='breadcrumb_divider'></div>")
    [projects, link_to("Add project", new_project_path, :remote => true)].join("<div class='breadcrumb_divider new'></div>").html_safe
  end
end
