# Сделать цикл
# Сделать одно условие
# сделать отгадывание путем подсказки числом

rand_number = (rand * 10).to_i + 1
puts "I riddled a number from 1 to 10"

print "Enter your number: "
user_number = gets.to_i

while rand_number != user_number 
    if user_number == rand_number
        puts "You won!"
    elsif user_number > rand_number 
        puts "My number is smaller"

        print "Enter your number: "
        user_number = gets.to_i
    elsif user_number < rand_number
        puts "My number is bigger"

        print "Enter your number: "
        user_number = gets.to_i
    end
end

