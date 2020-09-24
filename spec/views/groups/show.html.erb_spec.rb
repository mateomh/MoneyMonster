require 'rails_helper'

RSpec.describe 'groups/show', type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
                              creator_id: User.last.id,
                              name: 'Name',
                              icon: 'Icon'
                            ))
    @group_expenses = assign(:expense, Expense.all)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Icon/)
  end
end
