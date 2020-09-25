require 'rails_helper'

RSpec.describe 'expenses/edit', type: :view do
  before(:each) do
    User.create(name: 'mateo')
    session[:user_name] = User.last.name
    session[:user_id] = User.last.id
    session[:avatar] = User.last.avatar_url
    @expense = assign(:expense, Expense.create!(
                                  author_id: User.last.id,
                                  name: 'MyString',
                                  amount: 1.5
                                ))
  end

  it 'renders the edit expense form' do
    render

    assert_select 'form[action=?][method=?]', expense_path(@expense), 'post' do
      assert_select 'input[name=?]', 'expense[author_id]'

      assert_select 'input[name=?]', 'expense[name]'

      assert_select 'input[name=?]', 'expense[amount]'
    end
  end
end
