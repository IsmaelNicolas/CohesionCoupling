class UsersController < ApplicationController
  before_action :set_user

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # GET /users/:id/tasks
  def tasks
    render json: @user.tasks
  end

  # POST /users/:id/tasks
  def create_task
    @task = Task.create(task_params)
    @user.tasks << @task
    if @task.persisted?
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def task_params
      params.require(:task).permit(:title, :description)
    end

end
