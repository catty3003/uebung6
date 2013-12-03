class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.integer :number
      t.float :balance

      t.timestamps
    end
  end
end
