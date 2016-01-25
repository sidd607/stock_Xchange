class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :stock_value
      t.integer :stock_count

      t.timestamps null: false
    end
  end
end
