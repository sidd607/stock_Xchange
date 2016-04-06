class ChangeUsersModifyCollege < ActiveRecord::Migration
  def change
    remove_column :users, :college
    add_column :users, :college_id
  end
end
