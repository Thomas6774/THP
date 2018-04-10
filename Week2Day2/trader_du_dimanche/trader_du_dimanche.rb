def trader_du_dimanche(*value)
a = 0
b = 0
pstring = ''
value.each do |x|
y = x + 1
    while value[y]
    	a = value[y] - value[x]
    	if a > b
    		b = a
    		pstring = "[#{x},#{y}] : $#{value[y]} - $#{value[x]} = $#{b}"
    	end
    	y += 1
	end
end
puts pstring
end
trader_du_dimanche(0.1, 10, 20, 500, 10)