require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    User.delete_all
    Expense.delete_all
    Group.delete_all
    Groupedtransaction.delete_all
    @test_u = User.create(name: 'mateo')
    @test_e = Expense.create(name: 'test expense', author_id: @test_u.id, amount: 50.0)
    @test_g = Group.create(name: 'test group', creator_id: @test_u.id)
    Groupedtransaction.create(group_id: @test_g.id, expense_id: @test_e.id)
  end

  it '1. Checks for the group name content validation' do
    g = Group.create(name:'<$%#>',creator_id: @test_u.id)
    expect(g).to be_invalid
  end

  it '2. Checks for the group name uniqueness validation' do
    g = Group.create(name:'test group',creator_id: @test_u.id)
    expect(g).to be_invalid
  end

  it '3. Checks for the group name presence validation' do
    g = Group.create(name: nil,creator_id: @test_u.id)
    expect(g).to be_invalid
  end

  it '4. Checks for the group and expense models association' do
    expect(@test_g.expenses).not_to be_empty
  end

  it '5. Checks for the group and user models association' do
    expect{ @test_g.creator }.not_to raise_error
  end

  it '6. Checks the scope ordered_by_name' do
    Group.create(name: 'a test group', creator_id: @test_u.id)
    expect(Group.ordered_by_name[0].name).to be < Group.ordered_by_name[1].name
  end
end
