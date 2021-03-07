class GroupsController < ApplicationController
  before_action :signed_in_user, only: %i[new create index show]

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = "'#{@group.name}' group created successfully!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def index
    @groups = Group.all.order('name')
  end

  def show
    @group = Group.find_by(id: params[:id])
    @projects = Project.ug_incl.where(group_id: @group.id).desc
  end

  private

  def group_params
    params.require(:group).permit(:name, :user)
  end
end
