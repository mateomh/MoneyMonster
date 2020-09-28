class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :check_login

  # GET /groups
  # GET /groups.json
  def index
    @user = User.find(session[:user_id])
    # @groups = @user.groups.ordered_by_name
    @groups = Group.all.ordered_by_name
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group_expenses = @group.expenses.includes(:groupedtransactions, :groups, :author).ordered_by_most_recent
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
      else
        format.html { redirect_to new_group_path, alert: @group.errors.full_messages }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    
    respond_to do |format|
      if @group.destroy
        format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      else
        format.html { redirect_to groups_url, notice: "Group couldn't be destroyed." }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.includes(:creator).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:creator_id, :name, :icon)
  end

  def check_login
    redirect_to root_path if session[:user_name].nil?
  end
end
