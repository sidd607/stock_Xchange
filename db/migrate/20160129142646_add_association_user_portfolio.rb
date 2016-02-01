class AddAssociationUserPortfolio < ActiveRecord::Migration
  def change
      remove_column :portfolios, :user_id
      change_table :portfolios do |t|
          t.belongs_to :user
      end
  end
end
