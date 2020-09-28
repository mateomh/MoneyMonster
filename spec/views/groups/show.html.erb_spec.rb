require 'rails_helper'

RSpec.describe 'groups/show', type: :view do
  before(:each) do
    User.create(name: 'mateo')
    session[:user_name] = User.last.name
    session[:user_id] = User.last.id
    session[:avatar] = User.last.avatar_url
    @group = assign(:group, Group.create!(
                              creator_id: User.last.id,
                              name: 'Name',
                              icon: 'Icon'
                            ))
    @group_expenses = assign(:expense, Expense.all)
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Icon/)
  end
end
