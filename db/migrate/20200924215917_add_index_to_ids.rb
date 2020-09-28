class AddIndexToIds < ActiveRecord::Migration[6.0]
  def change
    add_index :expenses, :author_id
    add_index :groups, :creator_id
    add_index :groupedtransactions, :group_id
    add_index :groupedtransactions, :expense_id
  end
end
