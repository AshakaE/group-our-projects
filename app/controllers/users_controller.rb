class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "#{@user.name}, your account was created successfully."
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.name == user_params[:name]
      flash[:alert] = 'Try again, name already exists'
      redirect_to edit_user_path
    elsif @user.update(user_params)
      redirect_to @user, notice: 'Your display name was successfully updated.'
    else
      render :edit
    end
  end

  # session  methods
  def signin; end

  def signedin
    user = User.find_by(name: params[:name])

    if user.present?
      session[:user_id] = user.id
      redirect_to user, notice: "#{user.name} Logged in successfully"
    else
      flash[:alert] = 'Invalid User'
      render 'signin'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'logged out'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end
end
