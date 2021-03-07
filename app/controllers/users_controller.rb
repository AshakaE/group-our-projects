class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] =  @user.id
      redirect_to @user, notice: "#{@user.name}, your account was created successfully."
    else
      render 'new'
    end
  end

  def show

  end

  #session  methods
  def signin; end
  
  def signedin
    user = User.find_by(name: params[:name])

    if user.present? 
      session[:user_id] = user.id
      redirect_to user, notice: "#{user.name} Logged in successfully"
    else
      flash[:alert] = "Invalid User"
      render 'signin'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "logged out"
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
