class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :code, :limit=>2, null: false
      t.string :name, :limit=>30, null: false
      t.integer :stock_type, :limit=>2, null: false
      # we are using stock_type instead of type as type symbol is not allowed in rails active record
      t.float :current_price, null: false
      t.float :opening_price
      t.float :day_high
      t.float :day_low
      t.integer :sold_count, :default=>0
      t.timestamps null: false
    end
  end
end
