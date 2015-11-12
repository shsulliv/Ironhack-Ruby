class Product < ActiveRecord::Base
	# has_many :bids
	belongs_to :user
	validates :title, presence: true
	validates :description, presence: true	
	validates :deadline, numericality: true

	def self.most_recent_items(n)
		order(created_at: :desc).limit(n)
	end
end
