class ProjectsController < ApplicationController
  load_and_authorize_resource
  respond_to :json, :html
  
  def index
    @projects = current_user.projects
    respond_with @projects
  end

  def show
    @task_lists = @project.lists.all
    @list = @task_lists.first
    respond_with @project
  end

  def create
    @project = Project.new(params[:project])
    @project.author = current_user
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      respond_with @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "new"
    end
  end

  def destroy
    @project.destroy
    redirect_to current_user.projects.first || new_project_path
  end
end

