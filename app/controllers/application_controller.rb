class ApplicationController < ActionController::Base
  protect_from_forgery
 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => 'Sorry, not allowed.'
  end

  def welcome
    render and return unless user_signed_in?
    flash.keep
    project = current_user.projects.first
    redirect_to project || new_project_path
  end
end

