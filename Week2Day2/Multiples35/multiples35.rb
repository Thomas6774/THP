a = 999
result = 0
while (a >= 0)
	if ((a % 3) == 0 || (a % 5) == 0)
		result += a
	end
	a -= 1
end
puts result