class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
  end

  def edit
    @list = List.find(params[:id])
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
    @list = List.find(params[:id])

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

