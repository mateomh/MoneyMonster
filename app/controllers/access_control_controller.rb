class AccessControlController < ApplicationController
  def signin
    valid_user = User.where(name: params[:user][:name])
    if valid_user.empty?
      flash.notice = "User doesn't exists"
      redirect_to users_path
    else
      session[:user_name] = params[:user][:name]
      session[:user_id] = valid_user[0].id
      session[:avatar] = valid_user[0].avatar_url
      flash.notice = "Welcome back #{session[:username]}"
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def logout
    session.destroy
    flash.notice = 'Logged out successfully'
    redirect_to users_path
  end
end
