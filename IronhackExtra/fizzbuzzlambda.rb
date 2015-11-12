class Database
    def run
        for i in 1..100
            puts i
            my_fizz_lambda =-> (i) {
                if i % 3
                puts "Fizz"
                end
            }
            my_fizz_lambda.call(i)

            my_buzz_lambda =-> (i) {
                if i % 5 == 0
                    puts "Buzz"
                end
            }
            my_buzz_lambda.call(i)

            my_fizzbuzz_lambda =-> (i) {
                if i % 3 == 0 && i % 5 == 0
                    puts "FizzBuzz"
                end
            }
            my_fizzbuzz_lambda.call(i)
        end
    end
end


Database.new.run