class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019 , 'dollar' => 1}
  def method_missing(method_id, *args, &block)  # capture all args in case have to call super
  	if method_id.to_s.eql? "in"
  		singular_currency = args[0].to_s.gsub( /s$/, '')
  	else	
    	singular_currency = method_id.to_s.gsub( /s$/, '')
    end

    if @@currencies.has_key?(singular_currency)
      self.send(method_id == :in ? :/ : :*, @@currencies[singular_currency])
    else
      super
    end
  end
end

class String
	def palindrome?
			str = self.to_s
			str1 = str.downcase.gsub(/[^a-z]/, '')
			str2 = str1.reverse
			str1 == str2
	end
end

module Enumerable
	def palindrome?
		self.to_a == self.to_a.reverse
	end
end

puts 25.yen