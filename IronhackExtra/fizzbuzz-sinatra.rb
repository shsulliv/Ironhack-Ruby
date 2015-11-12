# OK, so we got ourselves comfortable with Sinatra, and the way he plays the songs we write. That’s nice, our first web applications!
# Remember this moment :)

# Now I want you to think on a small web application with no UX at all and just a bit of interaction with a web client. You can do iterations
# on it so you add one feature at a time.

# Take a moment to read a bit of Sinatra documentation (test yourself!) and play with this tiny web framework. Use several routes, redirects,
# parameters and conditions.

# Go ahead! :D

require 'sinatra'
require 'sinatra/reloader'

set :port, 3007
set :bind, '0.0.0.0'

class FizzBuzz
  attr_accessor :conditions
  def initialize(conditions, lambda)
    @conditions = conditions
    @lambda = lambda
    @result = []
  end
  
  def run
    (1..100).each do |i|
      # i = print_number(i)
      # @result.push(print_number(i).to_s + "\n")
      @result.push(print_number(i).to_s + "\n")
    end
    @result
  end
  
  def print_number(number)
    result = ""

    @conditions.each do |condition, string|
      condition_result = @lambda.call(number, condition, string)
      if condition_result
        result += condition_result
      end
    end
    
    if result == ""
      number
    else
      result
    end
  end
end

lambda = ->(i, condition, string) do
  if i % condition.to_i == 0
    return string
  end
end

conditions = {
  # 3 => "Fizz",
  # 5 => "Buzz",
  # 7 => "Paff"
}

fizzbuzz = FizzBuzz.new(conditions, lambda)


get '/' do
  fizzbuzz.conditions[params['number']] = params['word'] # not working
  # "#{params['number']}" + " " + "#{params['word']}"
  # fizzbuzz.conditions.to_s
  fizzbuzz.run
end

get '/fizzbuzz/new' do
  # fizzbuzz.run
end
