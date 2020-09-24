require 'rails_helper'

RSpec.describe 'groups/show', type: :view do
  before(:each) do
    # @group = assign(:group, Group.create!(
    #                           creator_id: 2,
    #                           name: 'Name',
    #                           icon: 'Icon'
    #                         ))
    session[:user_name] = User.last.name
    session[:user_id] = User.last.id
    session[:avatar] = User.last.avatar_url
    @group = assign(:group, Group.create!(
                                creator_id: User.first.id,
                                name: 'Name',
                                icon: 'Icon'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    # expect(rendered).to match(/2/)
    # expect(rendered).to match(/Name/)
    # expect(rendered).to match(/Icon/)

    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Icon/)
  end
end
