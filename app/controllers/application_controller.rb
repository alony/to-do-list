class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :error => 'nope, sorry'
  end

  def welcome
    render and return unless user_signed_in?
    project = current_user.projects.first
    redirect_to project || new_project_path
  end
end

