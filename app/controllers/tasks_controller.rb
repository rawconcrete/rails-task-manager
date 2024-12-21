class TasksController < ApplicationController
  # set @task for specific actions to reduce repetition
  # before_action runs only for show, edit, update, and destroy
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # retrieve all tasks from database
    @tasks = Task.all
  end

  def show
    # show details for one task
  end

  def new
    # create a blank task for the form
    @task = Task.new
  end

  def create
    # save a new task to the database using form data
    @task = Task.new(task_params)
    if @task.save
      # redirect to task list if save is successful
      redirect_to tasks_path, notice: 'task saved. try not to overwork.'
    else
      # re-render form if save fails
      render :new
    end
  end

  def edit
    # edit an existing task
  end

  def update
    # update task with form data
    if @task.update(task_params)
      # redirect to task details if update is successful
      redirect_to task_path(@task), notice: 'task updated.'
    else
      # re-render edit form if update fails
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # delete a task from database
    @task.destroy
    # redirect to task list with confirmation message
    redirect_to tasks_path, notice: 'task deleted.'
  end

  private

  # find task by id for actions needing it
  def set_task
    @task = Task.find(params[:id])
  end

  # only allow specific parameters from form submission
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
