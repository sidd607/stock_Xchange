class Authorization < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user_id, :uid, :provider
	validates_uniqueness_of :uid, :scope => :provider
	def provider_name
		provider.titleize
	end

end
