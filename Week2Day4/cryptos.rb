require 'open-uri'
require 'nokogiri'
a = 0
b = 0
c = 0
tab = Hash.new
ptab = Hash.new
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #liens principal
page.xpath("//a[@class='currency-name-container']").each do |currencyname|	#nom des cryptos
cname = currencyname.text	#variable pour stocker le nom des cryptos en texte											
tab[a] = {"#{a}" => "#{cname}" }	#insertion dans le tableau noms
a +=1
end
page.xpath("//a[@class='price']").each do |price|	#prix des cryptos
pvalue = price.text	  #variable pour stocker la valeur des cryptos en texte
ptab[b] = {"#{b}"=> "#{pvalue}"}	#insertion dans le tableau prix
b += 1
end
while c <= a
puts "#{tab[c]}" + " " + "#{ptab[c]}"	#afficher tableau noms + tableau prix
c += 1
end