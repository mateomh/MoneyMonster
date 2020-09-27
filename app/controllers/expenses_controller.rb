class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :check_login

  # GET /expenses
  # GET /expenses.json
  def my_external
    @user = User.includes(:expenses, :groups).find(session[:user_id])
    @expenses = @user.expenses.includes(:groups, :author).stand_alone_expenses.ordered_by_most_recent
    render 'index'
  end

  # /mytransactions
  def index
    @user = User.includes(:expenses, :groups).find(session[:user_id])
    @expenses = @user.expenses.includes(:groups, :author).ordered_by_most_recent
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @group = params[:group]
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    respond_to do |format|
      if @expense.save
        unless group_param[:group_id].to_i.zero?
          Groupedtransaction.create(expense_id: @expense.id, group_id: group_param[:group_id])
        end
        format.html { redirect_to expenses_path, notice: 'Expense was successfully created.' }
      else
        format.html { redirect_to "/expenses/new/#{group_param[:group_id]}", alert: @expense.errors.full_messages }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:author_id, :name, :amount)
  end

  def group_param
    params.require(:expense).permit(:group_id)
  end

  def check_login
    redirect_to root_path if session[:user_name].nil?
  end
end
