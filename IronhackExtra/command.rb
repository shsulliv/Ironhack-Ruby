#
#
#class User
#    attr_accessor :username, :password
#    def initialize(username, password)
#        @username = username
#        @password = password
#    end
#end
#
#user1 = User.new("bob", "bob123")
#
#puts "What is your username?"
#answer = gets.chomp
#puts "What is your password?"
#answer2 = gets.chomp
#
#if answer == user1.username && answer2 == user1.password
#    puts "Please enter your full name:"
#    name = gets.chomp
#    num_words = name.split(" ").count
#    puts num_words
#else
#    puts "The information entered was incorrect."
#end

#
#---------------------

# Create a command line tool. This command line tool will ask you for a user and a password. 
# If correct it will ask to enter a text and the program will count the number of words.

# The password and user can be hardcoded into the source code.

class User
  attr_accessor :username, :password
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def valid_password?(password)
    @password == password
  end
end

class Authenticator
  def initialize(user, password)
    @user = user
    @password = password
  end
  
  def authenticate
    unless @user && @user.valid_password?(@password)
      puts "Wrong username or password. Bye!"
      exit
    end
  end
end

class WordsCounter
  def initialize(text)
    @text = text
  end
  
  def number_of_words
    @text.split(" ").size
  end
end

class CoolTool
  
  def initialize
    @users = []
  end
  
  def register_user(username, password)
    @users << User.new(username, password)
  end
  
  def start
    authenticate
    menu
  end
  
  private
  
  def authenticate
    puts "Please enter your username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp
    user = @users.select { |u| u.username == username }.first
    Authenticator.new(user, password).authenticate
  end
  
    def menu
        puts "Give me a text."
        answer = gets.chomp
        puts "Type words if you want to count all the words. Type letters if you want to count all the letters. Type reverse if you'd like to reverse the text. Type either uppercase or lowercase if you'd like to convert your text."
        answer2 = gets.chomp
            if answer2 == "words"
                puts WordsCounter.new(text).number_of_words
            elsif answer2 == "letters"
                puts answer.gsub(" ", "").length
            elsif answer2 == "reverse"
                puts answer.reverse
            elsif answer2 == "uppercase"
                puts answer.upcase
            elsif answer2 == "lowercase"
                puts answer.downcase
            else
        end
    end
    
end

my_cool_tool = CoolTool.new
my_cool_tool.register_user('rambo', 'rAmb0')
my_cool_tool.register_user('rocky', 'rocky123')
my_cool_tool.register_user('jules', 'seluj')
my_cool_tool.start