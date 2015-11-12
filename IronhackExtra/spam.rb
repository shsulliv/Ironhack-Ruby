class User
    attr_accessor :email :twitter :facebook
end

class NotifierFactory
    def self.send_notification(user)
        if user.email
            Email.new(user)
        else user.twitter
            Twitter.new(user)
        else user.facebook
            Facebook.new(user)
        end
    end
end

class Email
    def initialize(user)
        @user = user
    end
    def send_message
        puts "#{@user} You've got an email."
    end
end

class Twitter
    def initialize(user)
        @user = user
    end
    def send_message
        puts "#{@user} You've got a tweet."
    end
end

class Facebook
    def initialize(user)
        @user = user
    end
    def send_message
        puts "#{@user} You've got a notification."
    end
end

james = User.new
james.twitter = "@james"
NotifierFactory.send_notification(james).send_message



