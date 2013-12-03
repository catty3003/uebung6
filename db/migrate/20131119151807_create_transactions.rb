class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.float :amount
      t.text :description
      t.float :balance_after_transaction

      t.timestamps
    end
  end
end
