class Car
    def wheels
        4
    end
    def noise
        puts "Broom"
    end
end

class Bici
    def wheels
        2
    end
    def noise
        puts "Whrrrrrr"
    end
end

class Tricycle
    def wheels
        3
    end
    def noise
        puts "Creeeeeeek"
    end
end

class WheelsCounter
    def initialize(cars)
        @cars = cars
    end
    def count_wheels
        @cars.reduce(0) do |sum, vehicle|
            sum + vehicle.wheels
        end
    end
end

class SoundsCounter
    def initialize(vehicles)
        @vehicles = vehicles
    end
    def make_sounds
        @vehicles.each do |vehicle|
            puts vehicle.noise
        end
    end
end

vehicles = [Car.new, Bici.new, Tricycle.new]
num_wheels = WheelsCounter.new(vehicles).count_wheels
puts num_wheels
Soundsmaker.make_sounds(vehicles)