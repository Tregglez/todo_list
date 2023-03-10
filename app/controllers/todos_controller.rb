class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @todo.update(todo_params)
    redirect_to root_path
  end

  def destroy
    @todo.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
