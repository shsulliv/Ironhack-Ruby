# Write a function that receives a sentence and returns an array with the sentence's words sorted alphabetically. 
# Ignore case and punctuation.

# Recommended approach:
# First, split the array into words and sort it with the default sort method.
# Now, after splitting the array remove punctuation characters.
# After that, sort using a custom function that ignores cases when comparing words (you can compare both strings after calling upcase on them).

def sorted(phrase)
    split_phrase = phrase.split
    sort_phrase = split_phrase.sort
    all_caps = sort_phrase.uppcase
end

sorted("Today is a fine day.")
    
    