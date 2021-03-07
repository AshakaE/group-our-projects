class ProjectsController < ApplicationController
  before_action :signed_in_user, only: %i[new create show index]

  def new
    @project = Project.new
    @groups = Group.all.collect { |group| [group.name, group.id] }
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:notice] = "#{@project.name} project successfully created"
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def index
    @projects = Project.ug_incl.where(user_id: current_user.id).desc
  end

  def no_group
    @projects = Project.ug_incl.where({ group_id: nil, user_id: current_user.id }).desc
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :amount, :group_id)
  end
end
