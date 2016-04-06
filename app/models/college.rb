class College < ActiveRecord::Base
  has_many :users, :dependent => :restrict
end
