class CreateGroupTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :group_transactions do |t|
      t.references :group, null: false, foreign_key: true
      t.references :transaction_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
