class CreateGroupedtransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :groupedtransactions do |t|
      t.integer :group_id
      t.integer :expense_id

      t.timestamps
    end
  end
end
