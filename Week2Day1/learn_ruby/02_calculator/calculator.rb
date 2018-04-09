def add(a, b)
	return (a + b)
end

def subtract(a, b)
	return (a - b)
end

def sum(a)
	if (a.length == 0)
		a = 0
	else
		a.inject(:+)
	end
end

def multiply(a)
	a.inject(:*)
end

def power(a, b)
	a ** b;
end