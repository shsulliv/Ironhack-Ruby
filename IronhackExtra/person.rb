class Person
    attr_reader :name
    attr_accessor :age
    def initialize(name, age)
        @name = name
        @age = age
    end
end

andreu = Person.new("Andreu", 37)
puts andreu.name
