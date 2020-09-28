class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_login, except: %i[index new create show]

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    @user = User.new
    render 'sign_in'
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_name] = @user.name
        session[:user_id] = @user.id
        session[:avatar] = @user.avatar_url
        format.html { redirect_to "/users/#{@user.id}", notice: 'User was successfully created.' }
      else
        format.html { redirect_to new_user_path, alert: 'User already exists' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      else
        format.html { redirect_to users_url, notice: "User couldn't be destroyed." }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :avatar_url)
  end

  def check_login
    redirect_to root_path if session[:user_name].nil?
  end
end
