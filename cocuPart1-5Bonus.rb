class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s       # make sure it's a string
        attr_reader attr_name            # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter
        class_eval %Q"
        def #{attr_name}= (value)
        	@#{attr_name}_history ||= [@#{attr_name}]
        	@#{attr_name} = value 
        	@#{attr_name}_history << value 
		end"
    end
end

class Foo
    
     def method_missing(method_id, *args, &block)
    	attr_accessor_with_history :bar
    end

end

blah = Foo.new
blah.ba = "Sosa"
blah.bar = "Cocu"
blah.bar = "CS345"
puts blah.bar.inspect
puts blah.bar_history.inspect