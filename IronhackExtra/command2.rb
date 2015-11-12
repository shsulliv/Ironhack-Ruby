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
    
    def load_users(filename)
        read_file = IO.read(filename)
        users = read_file.split("\n\n")
        users.each do |user|
            data = user.split("\n")
            self.register_user(data[0], data[1])
        end
        puts @users[0].password
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

  def words(answer)
    puts WordsCounter.new(answer).number_of_words
  end

  def letters(answer)
    puts answer.gsub(" ", "").length
  end

  def reverse(answer)
    puts answer.reverse
  end

  def upcase(answer)
    puts answer.upcase
  end

  def lowercase(answer)
    puts answer.downcase
  end

  def menu
    puts "Give me a text"
    answer = gets.chomp
    puts "Type words if you want to count the words. Type letters if you want to count the letters. Type reverse if you want to reverse the text. Type either uppercase or lowercase if you want to perform one of these functions."
    answer2 = gets.chomp
    send(answer2, answer)
  end
end

my_cool_tool = CoolTool.new
my_cool_tool.load_users("users.txt")
my_cool_tool.start
