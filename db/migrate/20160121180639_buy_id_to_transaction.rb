class BuyIdToTransaction < ActiveRecord::Migration
  def change
      add_column :transactions, :buy_id, :integer
  end
end
