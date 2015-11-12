# Your task is to implement a function that calculates an election winner from a 
# list of voter selections using an Instant Runoff Voting algorithm.
# If you haven't heard of IRV, here's a basic overview (slightly altered for this kata):

# Each voter selects several candidates in order of preference.
# The votes are tallied from the each voter's first choice.
# If the first-place candidate has more than half the total votes, they win.
# Otherwise, find the candidate who got the least votes and remove them from
# each person's voting list.
# In case of a tie for least, remove all of the tying candidates.
# In case of a complete tie between every candidate, return nil.
# Start over.
# Continue until somebody has more than half the votes; they are the winner.
# Your function will be given a list of voter ballots; each ballot will be a list of
# candidates (symbols) in descending order of preference.
# You should return the symbol corresponding to the winning candidate.
# See the default test for an example!

empty_voters = []

voters = [
	[:dem, :ind, :rep],
    [:rep, :ind, :dem],
    [:ind, :dem, :rep],
    [:ind, :rep, :dem]]

tough_votes = [
	[:a, :c, :b, :d, :e],
	[:d, :c, :a, :b, :e],
	[:e, :b, :d, :a, :c],
	[:e, :a, :b, :c, :d],
	[:b, :c, :e, :a, :d]]

tie_voters = [
	[:a, :c, :d, :e, :b],
	[:e, :b, :d, :c, :a],
	[:d, :e, :c, :a, :b],
	[:c, :e, :d, :b, :a],
	[:b, :e, :a, :c, :d]]


def runoff(voters)
	return nil if voters.empty?
	
	max_votes = 0

	while max_votes <= voters.length / 2
		votes_count = Hash.new(0)
		max_candidate = nil

		voters.each do |votes|
			next if votes.empty?
			votes_count[votes[0]] += 1
		end

		max_votes = 0
		max_candidate = voters[0][0]
		least_votes = voters.length
		least_candidates = [] 

		votes_count.each do |key, value|
			if value > max_votes
				max_candidate = key
				max_votes = value
			elsif value < least_votes
				least_votes = value
			end
		end

		least_candidates = votes_count.select { |k, v| v == least_votes }.keys

		if max_votes <= voters.length / 2
			voters.each do |votes|
				least_candidates.delete(least_candidate)
				end
			end
		end

		break if max_candidate.nil?
	end

	max_candidate
end

p runoff(tough_votes)

