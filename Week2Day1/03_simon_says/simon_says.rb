def echo(a)
	return "#{a}"
end

def shout(a)
	return "#{a.upcase}"
end

def repeat(a, b = 2)
	return (([a] * b)).join(" ")
end

def start_of_word(a, b)
	a[0, b]
end

def first_word(a)
	a.split.first
end

def titleize(a)
	arr = a.split
	arr[0].capitalize!
	arr.each do |b|
		if b != "over"
		if b.length > 3
			b.capitalize!
		end
	end
end
return arr.join(" ")
end