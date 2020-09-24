require 'rails_helper'

RSpec.describe Groupedtransaction, type: :model do
  it 'Checks that null values cannot be entered in the model' do
    gt = Groupedtransaction.create(group_id: nil, expense_id: nil)
    expect(gt).to be_invalid
  end

  it 'Checks that non existing values cannot be entered in the model' do
    gt = Groupedtransaction.create(group_id: 0, expense_id: 0)
    expect(gt).to be_invalid
  end
end
