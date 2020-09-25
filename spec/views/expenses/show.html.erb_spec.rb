require 'rails_helper'

RSpec.describe 'expenses/show', type: :view do
  before(:each) do
    User.create(name: 'mateo')
    session[:user_name] = User.last.name
    session[:user_id] = User.last.id
    session[:avatar] = User.last.avatar_url
    @expense = assign(:expense, Expense.create!(
                                  author_id: User.last.id,
                                  name: 'Name',
                                  amount: 3.5
                                ))
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3.5/)
  end
end
