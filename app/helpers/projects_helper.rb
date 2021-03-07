module ProjectsHelper
  def logged_in_user
    return if logged_in?

    flash[:alert] = 'Please login or signup to have access'
    redirect_to root_path
  end
end
