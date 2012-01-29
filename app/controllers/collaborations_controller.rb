class CollaborationsController < ApplicationController
  before_filter :get_project

  def new
    @collaboration = @project.collaborations.build
  end

  def create
    user = User.find_or_initialize_by_email(params[:collaboration][:email].strip)
    redirect_to project_collaborations_path(@project),
       :notice => "#{user.username} is already invited" and return if @project.collaborators.include? user

    user.generate_pwd! and user.save if user.new_record?
    @project.users << user
    redirect_to project_collaborations_path(@project), :notice => "#{user.username} is invited to the project"
  end

  def index
    @users = @project.users
  end

  def destroy
    @project.collaborations.where(user_id: params[:id]).first.destroy
    redirect_to project_collaborations_path(@project), :notice => "User removed from the project"
  end

  protected
  def get_project
    @project = Project.find_by_id params[:project_id]
  end
end

