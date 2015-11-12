# # Start by creating a class with methods to parse the text file slides.txt. It should give 
# you an array where each item is a line of text to display as a slide.

# # Make a second class with the methods to show the presentation. You will need to find out the height of the user's terminal, 
# and then calculate how many empty lines to print before and after the text to vertically center it. You will also need to get 
# the width of the terminal and calculate how many spaces to print before and after the line of the text to horizontally center it.

# # Create a method that deals with the user input: next or previous. You can use the indices of the items in the 
# array to select the one you want to show.

require 'terminfo'
# require 'pry'

class SlideFile

	def read_file(file)
		IO.readlines(file)
	end

	def create(file)
		texts = read_file(file).map(&:strip)
		slides = []
		texts.each do |text|
			slide = Slide.new(text)
			slides << slide
		end
		slides
	end
end

class Slide

	def initialize(text)
		@text = text
		@term_height = TermInfo.screen_size[0]
		@term_width = TermInfo.screen_size[1]
	end

	def print
		num_white_spaces = @term_width / 2 - (@text.length / 2)
		puts ("\n") * (@term_height / 2)
		puts (" " * num_white_spaces) + @text
		puts ("\n") * (@term_height / 2)
	end

end


class SlideShow
	# attr_accessor :term, :slides

	def initialize(texts)
		@slides = texts
	end

	def show_slides
		@slides.each do |slide|
			slide.print
		end
	end
end


slides = SlideFile.new.create("my_slides.txt")

slide_show = SlideShow.new(slides)
slide_show.show_slides





