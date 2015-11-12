require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'active_record'
require 'pry'

set :port, 3004
set :bind, '0.0.0.0'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base
  validates_presence_of :name, :handle # presence, name+handle
  validates :name, presence: true, uniqueness: true # presence+uniqueness, name
  # add validation for the password. It should be 8 characters long and unique
  has_many :shouts
  def presence_username
  	unless name.present?
  		errors.add(:name, 'must be present')
  	end
  end
  def presence_password
		unless password.present?
			errors.add(:password, 'must be present')
		end
  	unless password.nan?
  		errors.add(:password, "must be a number")
  	end
  end
  def give_password
  	8.times do |x|
  		x.rand(1..9)
  	end
  end
end

class Shout < ActiveRecord::Base
  validates :likes, numericality: { greater_or_equals_than: 0, only_integer: true }
  # add validations for the message and the user id
  belongs_to :user
end

get '/' do
	erb :index
end

post '/submit ' do
	@shout = params
	@shout
	binding.pry
	redirect '/'
	erb :index
end

get '/home' do
	erb :home 
end