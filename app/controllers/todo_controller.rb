class TodoController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.create(todo_params)
    todo.save
    redirect_to todo_path(todo)
  end

  def update
    @todo.update(todo_params)
    redirect_to todo_path(@todo)
  end

  def destroy
    @todo.destroy
    redirect_to todo_path, status: :see_other
  end

  private

  def todo_params
    param.require(:todo).permit(:title, :description, :completed)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
