require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        author_id: 2,
        name: "Name",
        amount: 3.5
      ),
      Expense.create!(
        author_id: 2,
        name: "Name",
        amount: 3.5
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
  end
end
