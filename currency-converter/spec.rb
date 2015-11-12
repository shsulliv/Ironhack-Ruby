require_relative "./oc3.rb"

describe TheBanker do 
	before do 
		@banker = TheBanker.new
	end

	describe "#self.convert" do
		answers = [3.891, 6.718, 2.934, 18.42]
		questions = [[5, "usd", "eur"], [11, "usd", "gbp"], [3, "aud", "cad"], [10, "gbp", "aud"]]
		specs = []
		questions.each_with_index do |question, index|
			amount = question.first
			first_curr = question[1]
			second_curr = question[2]
			it "takes an amount in US dollars and converts it to euros" do
				expect(@banker.convert(amount, first_curr, second_curr)).to eq(answers[index])
			end
		end
	end
end


