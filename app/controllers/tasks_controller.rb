class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def assigned
    @tasks = current_user.tasks_to_do
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    render 'new'
  end

  def new
    @task = Task.new priority: 1, status: :new, assigned_id: current_user.id, list_id: params[:list_id]
    @project = List.find_by_id(params[:list_id]).project
  end

  def create
    @task = Task.new(params[:task])
    @task.author = current_user

    if @task.save
      redirect_to @task.list, notice: 'Task was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task.list, notice: 'Task was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to @task.list
  end
end

