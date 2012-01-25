module ApplicationHelper
  def projects_list
    projects = current_user.projects.map do |project| 
      link_to project.name, project, :class => (current_page?(project_path project) ? "current" : '')
    end.join("<div class='breadcrumb_divider'></div>")
    [projects, link_to("Add project", new_project_path)].join("<div class='breadcrumb_divider new'></div>").html_safe
  end
end
