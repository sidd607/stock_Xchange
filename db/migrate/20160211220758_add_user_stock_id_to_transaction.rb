class AddUserStockIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :user_stock_id, :integer
  end
end
