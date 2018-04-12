require 'nokogiri'
require 'open-uri'

def get_email_of_a_townhall_from_its_webpage(webpage)
page = Nokogiri::HTML(open(webpage))
page.xpath("//td[starts-with(., 'communication')]").each do |take|
    puts take.text
end
end

#get_email_of_a_townhall_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")
$rest = 0
$result = 0
$goodvalue = 0
def get_all_the_urls_of_val_doise_townhalls()

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
page.xpath("//a[@class = 'lientxt']").each do |links|
openpages = links["href"]
$goodvalue += 1
    

getemail = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + openpages))
getemail.xpath("//td[contains(. , '@')]").each do |emails|
puts emails.text
number = getemail.xpath("//td[contains(. , '@')]")
$result += number.length
end

end
puts "Total of email adresses is : " + $result.to_s
puts "Should have a total of : " + $goodvalue.to_s
$rest = $goodvalue - $result
puts $rest.to_s + " Townhalls have no email adress ."
end

get_all_the_urls_of_val_doise_townhalls()