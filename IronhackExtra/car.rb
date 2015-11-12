class Car
    def initialize(noise)
        @cities = []
        @sound = noise
    end
    def make_noise
        puts @sound
    end
    def self.twice_noise(car)
        car.make_noise
        car.make_noise
    end
    def city_visit(city)
        @cities.push(city)
    end
    def cities(file)
        IO.write(file, @cities)
    end
end

class Racing < Car
    def initialize
        super("BROOOOOOM!")
    end
end

#my_car = Car.new("Broom")
#my_newer_car = Car.new("BROOOOM")
#
#my_car.make_noise
#my_newer_car.make_noise
#
#Car.twice_noise(my_car)
#Car.twice_noise(my_newer_car)
#
#my_car.city_visit("Memphis")
#my_car.cities("New File")
#
#car_three = Racing.new
#car_three.make_noise
#
#chevy = Car.new("Vroom")
#ford = Car.new("Honk")
#bmw = Car.new("BANG")
#
#my_array = [chevy, ford, bmw]
#my_array.each do |car|
#    car.make_noise
#end

#def car_noises(*cars)
#    brands = []
#    new_array = []
#    brands << cars
#    puts brands
#    brands.each do |car|
#        car = Car.new("honk")
#        new_array << car
#        car.make_noise
#    end
#    # new_array.each do |car|
#       # car.make_noise
#    #end
#end
#
#car_noises("jeep", "ferrari", "honda")

sounds = ["Broom", "Meek", "Nyan"]
cars = sounds.map do |thing|
    Car.new(thing)
end

cars.each do |sound|
    sound.make_noise
end


dict = sounds.each_with_object({}) do |item, car|
    car[item] = Car.new(item)
end

single_line = cars.reduce { |x| x.to_s }
puts single_line
    



