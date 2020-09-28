class AccessControlController < ApplicationController
  def signin
    valid_user = User.where(user_params)
    if valid_user.empty?
      flash.notice = "User doesn't exists"
      redirect_to users_path
    else
      session[:user_name] = user_params[:name]
      session[:user_id] = valid_user[0].id
      session[:avatar] = valid_user[0].avatar_url
      flash.notice = "Welcome back #{session[:user_name]}"
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def logout
    session.destroy
    flash.notice = 'Logged out successfully'
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name)
  end
end
