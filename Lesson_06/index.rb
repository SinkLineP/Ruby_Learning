require "yaml"

# Ввести имя с клавиатуры

print "Enter your name: "
username = gets.strip

# Откуда-то взять вопросы и ответы
# YAML

data = YAML.safe_load_file("quetion.yml", symbolize_names: true) #читаем файл
puts data.inspect

# Брать каждый вопрос по очереди и предлагать 4 варинта ответа
# Юзер вводит ответ с клавиатуры
# Мы сравниваем ответ с клавиатуры