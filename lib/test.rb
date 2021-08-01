# puts "pick a number"
# number = gets.chomp.to_i
number = "2"

if number.is_a? Numeric
        puts "Is a number =>>>> #{number}"
else 
    puts "not a number"
end
