require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.delete_all
    Expense.delete_all
    Group.delete_all
    Groupedtransaction.delete_all
    @test_u = User.create(name: 'mateo')
    Expense.create(name: 'test expense', author_id: @test_u.id, amount: 50.0)
    Group.create(name: 'test group', creator_id: @test_u.id)
  end

  it '1. Checks for the user name precense validation' do
    u = User.create(name: nil)
    expect(u).to be_invalid
  end

  it '2. Checks for the user name content validation' do
    u = User.create(name: '<$%#>')
    expect(u).to be_invalid
  end

  it '3. Checks for the unique user name validation' do
    u = User.create(name: 'mateo')
    expect(u).to be_invalid
  end

  it '4. Checks for a successful user creation' do
    expect(@test_u).to be_valid
  end

  it '5. Checks the association between the expense and user models' do
    expect(@test_u.expenses).not_to be_empty
  end

  it '6. Checks the association between the group and user models' do
    expect(@test_u.groups).not_to be_empty
  end
end
