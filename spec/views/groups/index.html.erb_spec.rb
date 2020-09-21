require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        creator_id: 2,
        name: "Name",
        icon: "Icon"
      ),
      Group.create!(
        creator_id: 2,
        name: "Name",
        icon: "Icon"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Icon".to_s, count: 2
  end
end
