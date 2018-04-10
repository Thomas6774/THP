def chiffre_de_cesar(a, b)

if (b > 25)
    b = b % 26
end

array = a.split ""
array.each do |test|
    
    if (test >= 'a' && test <= 'z')
        test.gsub!(test, ((test.ord + b).chr))
        if (test.ord > 122)
            tmp = test.ord - 122
            test.gsub!(test, ((96 + tmp).chr))
        end
    end
    
    if (test >= 'A' && test <= 'Z')
        test.gsub!(test, ((test.ord + b).chr))
        if (test.ord > 90)
            tmp = test.ord - 90
            test.gsub!(test, ((64 + tmp).chr))
        end
    end
    
end
a = array.join('')
end
puts chiffre_de_cesar("azbcde", 1)