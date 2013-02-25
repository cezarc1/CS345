# Written by Cezar Cocu
def palindrome?(str)
  str1 = str.downcase.gsub(/[^a-z]/, '')
  str2 = str1.reverse
  str1 == str2
end

def count_words(str)
	words = str.downcase.split(/[\b\s\W]/i)
	words.delete("")
	frequency = Hash.new(0)
	words.each { |word| frequency[word] += 1}
	return frequency
end