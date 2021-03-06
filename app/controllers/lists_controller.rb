class ListsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @lists = List.all
  end

  def show
    @tasks = @list.tasks
  end

  def edit
    render 'new'
  end

  def new
    @list = List.new
    @list.project_id = params[:project_id]
  end

  def create
    @list = List.new(params[:list])
    render action: "new" unless @list.save
  end

  def update
    if @list.update_attributes(params[:list])
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @list_destroy = List.find(params[:id])
    @project = @list_destroy.project
    @list_destroy.destroy

    @list = @project.lists.first || @project.lists.build
  end
end

