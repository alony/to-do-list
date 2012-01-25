class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @task_lists = @project.lists.all
    @list = @task_lists.first
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.author = current_user
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
end

