class User < ActiveRecord::Base
	has_many :products
	validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  has_secure_password

	def self.remove_unsold_items(date = 2.months.ago)
		where("created_at: < ?", date).destroy_all
	end

	def self.most_recent_items(n)
		order(created_at: :desc).limit(n)
	end
end
