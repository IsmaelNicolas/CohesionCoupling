class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy, :start, :complete]
  before_action :set_project
  # GET /tasks
  # def index
  #   @tasks = Task.all
  #   render json: @tasks
  # end

  # GET /tasks/:id
  def show
    render json: @task
  end

  # POST /tasks
  # def create
  #   @task = Task.new(task_params)

  #   if @task.save
  #     render json: @task, status: :created, location: @task
  #   else
  #     render json: @task.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  # PATCH /tasks/:id/start
  def start
    if @task.in_progress!
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH /tasks/:id/complete
  def complete
    if @task.completed!
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # GET /projects/:project_id/tasks
  def index
    @tasks = @project.tasks
    render json: @tasks
  end

  # POST /projects/:project_id/tasks
  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
