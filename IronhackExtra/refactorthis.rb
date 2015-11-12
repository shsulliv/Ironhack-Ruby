require 'pry'

class Blog
	attr_accessor :all_posts

	def initialize
		@all_posts = []
		@position = 0
	end

	def add_post(post)
		@all_posts << post
	end
 
    def publish_all #this method avoids separately calling both methods mentioned below
        sort_by_date
        publish_front_page
    end

    def sort_by_date
        @all_posts = all_posts.sort_by! {|post, date| post.date} #removed reverse so that the posts would come in order
	end

	def publish_front_page
		@all_posts.each do |post|
            if post.sponsored
                puts "************" + post.title + "**************"
            else
			 puts post.title
			 puts post.date
			 puts "****************"
			 puts post.text
			 puts "----------------"
            end
		end
	end
end

class Post
    attr_accessor :title, :text, :date, :sponsored
    def initialize(title, text, date, sponsored = false)
		@title = title
		@text = text
		@date = date
        @sponsored = sponsored
	end
end

my_blog = Blog.new

my_blog.add_post Post.new("Title 1", "1st body", Time.new)
my_blog.add_post Post.new("Title 2", "Body 2", Time.new)
my_blog.add_post Post.new("Title 3", "Body 3", Time.new)
my_blog.add_post Post.new("Title4", "Body4", Time.new, true) #added 'true' value for :sponsored attribute
my_blog.add_post Post.new("Title5", "Body5", Time.new)
my_blog.add_post Post.new("Title6", "Body6", Time.new)
my_blog.add_post Post.new("Title7", "Body7", Time.new)
my_blog.add_post Post.new("Title8", "Body8", Time.new)

my_blog.publish_all