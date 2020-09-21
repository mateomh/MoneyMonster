require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      creator_id: 1,
      name: "MyString",
      icon: "MyString"
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input[name=?]", "group[creator_id]"

      assert_select "input[name=?]", "group[name]"

      assert_select "input[name=?]", "group[icon]"
    end
  end
end
