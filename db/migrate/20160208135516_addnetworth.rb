class Addnetworth < ActiveRecord::Migration
  def change
	add_column :users, :net_worth, :float
  end
end
