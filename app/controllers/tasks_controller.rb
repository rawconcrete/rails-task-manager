class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # create blank template
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'task saved. try not to overwork.'
    else
      render :new
    end
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def edit
    @task = Task.find(params[:id])
  end

end
