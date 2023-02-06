# 1. Принять ввод с клавиатуры
print "Enter your age: "
user_input_age = gets.to_i
# 2. Сравнить возраст со значением 18
result = age > 18
# 3. Не пускать если возраст меньше 18 лет
if result
    puts "Yes, Go!"
else
    puts "No, Stop!"
end
