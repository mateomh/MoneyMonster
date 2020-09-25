require 'rails_helper'

RSpec.describe 'groups/edit', type: :view do
  before(:each) do
    User.create(name: 'mateo')
    session[:user_name] = User.last.name
    session[:user_id] = User.last.id
    session[:avatar] = User.last.avatar_url
    @group = assign(:group, Group.create!(
                              creator_id: User.first.id,
                              name: 'MyString',
                              icon: 'MyString'
                            ))
  end

  it 'renders the edit group form' do
    render

    assert_select 'form[action=?][method=?]', group_path(@group), 'post' do
      assert_select 'input[name=?]', 'group[creator_id]'

      assert_select 'input[name=?]', 'group[name]'

      assert_select 'input[name=?]', 'group[icon]'
    end
  end
end
