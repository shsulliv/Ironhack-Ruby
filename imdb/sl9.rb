# SL9. I’m damn right about TV series!

# I love TV series. I hope you do too. One of the main topics about TV series is The Absolute Truth Answers, which everyone thinks
# he has but no one truly does.

# Is Lost Finale as shitty as everyone says? Is The Wire the best TV series ever, or is it Breaking Bad? WHY WAS FIREFLY CANCELLED?
# Is it true that whoever wrote Heroes season 3 was the Devil himself? Why is Community so underrated, being in fact the best comedy ever?

# Write a class, let’s say SeriesMasterOfTheUniverse, with several methods answering questions about the series universe. Try to add
# parameters to most questions: there is no point in testing constants! Then add the testing for it using RSpec. Write several tests
# for each question, exploring different scenarios.

# An example of a method is one that, when passing a list of some TV series, returns the best one. For instance, when prefering The Wire
# when comparing it to Friends, it should pass the tast. Otherwise, if it returns Mom as the best comedy aired on 2013, it should fail
# (I mean, Veep or Community were definitely better).

# Upgrade: use IMDB Ruby gem to remove arbitrarity!

class SeriesMaster
	SERIES_INFORMATION ={
			'The Wire' => 3,
			'GoT' => 2,
			'Breaking Bad' => 1,
			"Big Bang Theory" => 4
		}

	def rank
		ranks = SERIES_INFORMATION.values
		@sorted_ranks = ranks.sort 
		sorted_series = @sorted_ranks.map do |ranking|
			SERIES_INFORMATION.key(ranking)
		end
		sorted_series.each do |title|
			title
		end
	end

	def which_is_better(series1, series2)
		rank1 = SERIES_INFORMATION[series1]
		rank2 = SERIES_INFORMATION[series2]
		if rank1 > rank2
			return SERIES_INFORMATION.key(rank2)
		else
			return SERIES_INFORMATION.key(rank1)
		end
	end

	def add(new_title)
		rank
		new_ranking = @sorted_ranks.last + 1
		SERIES_INFORMATION[new_title] = new_ranking
		SERIES_INFORMATION
	end
end

# series = SeriesMaster.new
# series.which_is_better("GoT", "Big Bang Theory")
# p series.add("OITNB")