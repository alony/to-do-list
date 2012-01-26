class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def welcome
    render and return unless user_signed_in?
    project = current_user.projects.first
    redirect_to project || new_project_path
  end
end

