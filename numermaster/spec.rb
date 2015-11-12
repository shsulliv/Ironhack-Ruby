require 'rspec'
require_relative './sl12.rb'

describe Numermaster do 
	before do
		@master = Numermaster.new
	end
end

	describe "#pos_neg" do
		it "should return all the positive values in an array if they're most common" do
			expect(@master.pos_neg[-1, 2, 3, 4, -6]).to include([2, 3, 4])
		end
	end

		it "should return all the negative values in an array if they're most common" do
			expect(@master.pos_neg[-1, 2, 3, 4, -6]).to include([-1, -6])
		end

		it "should return 'nil' if the number of positive values equals the number of negative values" do
			expect(@master.pos_neg([-1, 2, 3, 4, -6, -4])).to eq(nil)
		end

	describe "#redux" do
		it "take an array and return a new array with the mean, median, mode, and length of the first array." do
			expect(@master.redux([1, 2, 3, 3, 3])).to include([2, 3, 3, 5])
		end
	end

		it "should return nil in the event of an empty array" do
			expect(@master.redux([])).to eq(nil)
		end

	describe "#fibonacci" do
		it "should return the n-th Fibonacci number" do
			expect(@master.fibonacci(6)).to eq(8) #start fibonacci sequence at zero
		end
	end

		it "should return nil if n-th number is zero" do
			expect(@master.fibonacci[0]).to eq(nil) #start fibonacci sequence at zero
		end
