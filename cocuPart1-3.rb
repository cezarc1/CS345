def combine_anagrams(words)
  words.group_by{|foo| foo.downcase.chars.sort}.values
end