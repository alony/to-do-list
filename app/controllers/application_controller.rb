class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_project
  
  protected
  def current_project
    @project ||= current_user.projects.first
  end
end
