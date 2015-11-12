require_relative "./sl9.rb"

describe SeriesMaster do
	before do
		@series = SeriesMaster.new
	end

	describe "#rank" do
		it "should rank the series" do
			expect(@series.rank[0]).to eq("Breaking Bad")
		end
	end

	describe "#which_is_better" do
		it "should tell me the better series with GoT" do
			expect(@series.which_is_better("GoT", "The Wire")).to eq("GoT")
		end

		it "should tell me the better series with BBT" do
			expect(@series.which_is_better("GoT", "Big Bang Theory")).to eq("GoT")
		end
	end

	describe "#add" do
		it "should add a new series and ranking to the list" do
			ranks = @series.add("OITNB")
			expect(ranks.keys).to include("OITNB")
			expect(ranks.values).to include(5)
		end
	end
end