class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :title, :presence => true, :length => { :minimum => 5 }
  validates :name,  :presence => true
  has_many :comments
end
