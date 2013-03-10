# def combine_anagrams(words)
#   words.group_by{|foo| foo.downcase.chars.sort}.values
# end
def combine_anagrams(words)
	words.group_by { |word| word.downcase.chars.sort}
end

puts combine_anagrams(["cars", "racs", "for"]).inspect