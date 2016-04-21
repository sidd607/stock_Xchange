class IncreaseStockCodeSize < ActiveRecord::Migration
  def change
    change_column :stocks, :code, :string, :limit => 10
  end
end
