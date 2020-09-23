require 'rails_helper'

RSpec.describe Expense, type: :model do
  User.delete_all
  Expense.delete_all
  Group.delete_all
  Groupedtransaction.delete_all

  test_u = User.create(name: 'mateo')
  Expense.create(name: 'first test expense', author_id: test_u.id, amount: 50.0)
  Expense.create(name: 'second test expense', author_id: test_u.id, amount: 20.0)
  test_e = Expense.first
  Group.create(name: 'test group', creator_id: test_u.id)
  test_g = Group.first
  Groupedtransaction.create(group_id: test_g.id, expense_id: test_e.id)
  
  it '1. Checks for the precense validation for both fields' do
    e = Expense.create(name: nil, amount: nil, author_id: test_u.id)
    expect(e).to be_invalid
  end

  it '2. Checks for the name content validation' do
    e = Expense.create(name:'<$%#>', amount: 50.0, author_id: test_u.id)
    expect(e).to be_invalid
  end

  it '3. Checks for the amount content validation' do
    e = Expense.create(name:'test expense', amount: "aaa", author_id: test_u.id)
    expect(e).to be_invalid
  end

  it '4. Checks the successful expense creation' do
    e = Expense.create(name:'test expense', amount: 50.0, author_id: test_u.id)
    expect(e).to be_valid
  end

  it '5. Checks for the author association' do
    expect(test_e.author).not_to be_nil
  end

  it '6. Checks for the groups association through the groupedtransactions model ' do
    expect(test_e.groups).not_to be_empty
  end

  it '7. Checks the ordered_by_most_recent scope' do
    a = test_u.expenses.ordered_by_most_recent
    expect(a[0].created_at).to be > a[1].created_at
  end

  it '8. Checks the stand_alone_expenses scope' do
    expect{ test_u.expenses.stand_alone_expenses }.not_to raise_error
  end
end
