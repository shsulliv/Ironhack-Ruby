#Two Classes: Blog and Post
#Every post has a title, a date and text. So it needs also the methods to get that information.
#Blog: It has a container for all the posts. An array or something like that.
#A blog should be able to create and show a front page through the methods create_front_page and publish_front_page, but feel free to use the methods your want.
#The posts should be ordered by date starting on newest.

require 'date'

class Post
    attr_accessor :title, :date, :text, :sponsored
    def initialize(title, text, sponsored = false)
        @title = title
        @date = Date.today
        @text = text
        @sponsored = sponsored
    end
end

class Blog
    def initialize
        @all_posts = []
    end
    def add_post(post)
        @all_posts.push(post)
    end
    def publish_posts
        @all_posts.each do |post|
            if post.sponsored
                puts "************" + post.title + "**************"
            else
                puts post.title
            end
            puts post.date
            puts "*********************************************"
            puts post.text
            puts "---------------------------------------------"
        end
    end
end

sample_post = Post.new("Ironhack Day 2", "Lorem Ipsum sic dolor")
another_post = Post.new("Ironhack Day 2.1", "Lorem hipster homebrew williamsburg fixie ironic")
first_sponsored = Post.new("Ironhack Day 3", "Lorem hipster homebrew williamsburg fixie ironic", true)

new_blog = Blog.new
new_blog.add_post(sample_post)
new_blog.add_post(another_post)
new_blog.add_post(first_sponsored)

new_blog.publish_posts






