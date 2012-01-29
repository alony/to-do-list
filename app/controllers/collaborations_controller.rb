class CollaborationsController < ApplicationController
  before_filter :get_project

  def index
    @users = @project.users
  end

  protected
  def get_project
    @project = Project.find_by_id params[:project_id]
  end
end

