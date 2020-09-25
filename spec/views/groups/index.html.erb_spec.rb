require 'rails_helper'

RSpec.describe 'groups/index', type: :view do
  before(:each) do
    User.create(name: 'mateo')
    session[:user_name] = User.last.name
    session[:user_id] = User.last.id
    session[:avatar] = User.last.avatar_url
    assign(:groups, [
             Group.create!(
               creator_id: User.last.id,
               name: 'Name',
               icon: 'Icon'
             ),
             Group.create!(
               creator_id: User.last.id,
               name: 'Name2',
               icon: 'Icon'
             )
           ])
  end

  it 'renders a list of groups' do
    render
    assert_select 'div>h3', text: 'Name'.to_s, count: 1
    assert_select 'h3', text: 'Name2'.to_s, count: 1
  end
end
