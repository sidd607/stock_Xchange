class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :user
      t.belongs_to :stock
      t.float :stock_value
      t.integer :stock_count
      t.integer :transaction_type , null: false, :limit=>2
      # Transaction type is used to see if the transaction is of a NSE stock or a NASDAQ stock
      t.timestamps null: false
    end
  end
end
