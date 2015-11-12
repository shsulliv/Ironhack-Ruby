# SL7. Valid students are valid students

# You loved the example about students, huh? Let’s student you up then!

# So we are going to do some implementation on this Student class with the following:
# 1. Add a “complete_name” method.
# 2. Add some more validations of your own. For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Llorenç" and "Sharon" name, because we want them to be the only ones in Ironhack <3
# the same with “Nick”, because we love him starting at us doing yoga)
# 3. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method. Let’s go, folks!

# Note: you will find a student.rb template file and the student.sqlite database in Slack.
require 'pry'
require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'activerecord.sqlite'
)

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16
  NAME_MINIMUM = 2

  validates_presence_of :name, :surnames
  validates_format_of :website, with: /\Ahttp:/
  validates_numericality_of :number_of_dogs, greater_than: 0
  validate :proper_age

  private

  def proper_age
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
  end

  def complete_name 
  	unless names.length < NAME_MINIMUM
  		errors.add(:names, 'are incomplete')
  	end
	end
end

shannon = Student.new(name: "Shannon", birthday: Date.new(1989, 01, 31))
binding.pry 
shannon.name = "Shannon"
shannon.surnames = "Sullivan"

