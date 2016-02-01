class ChangeBuyId < ActiveRecord::Migration
  def change
      rename_column :transactions, :buy_id, :portfolio_id
  end
end
