class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]
  before_action :set_user, only: [:index, :create]

  # GET /users/:user_id/projects
  def index
    @projects = @user.projects
    render json: @projects
  end

  # POST /users/:user_id/projects
  def create
    @project = @user.projects.build(project_params)
    @project.leader_id = params[:leader_id] if params[:leader_id].present?

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # GET /projects/:id
  def show
    render json: @project
  end

  # # POST /projects
  # def create
  #   @project = @user.projects.build(project_params)
  #   @project.leader_id = params[:leader_id] if params[:leader_id].present?

  #   if @project.save
  #     render json: @project, status: :created, location: @project
  #   else
  #     render json: @project.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /projects/:id
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/:id
  def destroy
    @project.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :leader_id)
  end
end
