class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
  belongs_to :user_stock
end
