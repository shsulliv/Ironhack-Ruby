# make a blog that creates and publishes posts 

class Post
	attr_accessor :title, :date, :text 
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text 
	end
end

class Blog
	def initialize
	 @container = []
	end
	def add_post(post)
		@container.push(post)
		puts post.title
		puts post.date
		puts post.text
	end
end

post1 = Post.new("New Post", "Jan 4th", "This is text.")
post2 = Post.new("New Post", "Jan 4th", "This is text.")

blog = Blog.new
blog.add_post(post1)	


