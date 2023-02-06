require "yaml"

a_code = "A".ord #65
correct_answers = 0
incorrect_answers = 0

# Ввести имя с клавиатуры
print "Enter your name: "
username = gets.strip
current_time = Time.now.strftime("%Y-%m-%d_%H:%M:%S")

filename = "QUIZ_#{username}_#{current_time}.txt"

File.write(
    filename, 
    "Результаты для пользователя #{username}.\n\n#{current_time}", 
    mode: "a"
)

# Откуда-то взять вопросы и ответы
# YAML

all_questions = YAML.safe_load_file("quetion.yml", symbolize_names: true) #читаем файл
# puts all_questions.inspect

# Брать каждый вопрос по очереди и предлагать 4 варинта ответа

all_questions.shuffle.each do |question_data|
    puts "\n\n=== #{question_data[:question]} ===\n\n"

    # тут хранится не буква, а полный ответ
    correct_answer = question_data[:answers].first

    # тот хеш который конструируем
    # очредной ответ эллемент массива
    # индекс этого ответа
    # тут мы выводим при каждой итерации вводим 1 ответ
    answers = question_data[:answers].shuffle.each_with_index.inject({}) do |result, (answer, i)|
        # {"A" => "Ответ 1", ...}
        answer_char = (a_code + i).chr # получаем букву для ответа
        result[answer_char] = answer # result = {"A" => "Эквадор"}

        # А. Ответ 1
        puts "#{answer_char}. #{answer}"

        result # => теперь используй новое значение хеша для result
    end

    user_answer_char = nil
    # Юзер вводит ответ с клавиатуры
    loop do # это цикл, который запрашивает ввод с клавиатуры
        puts "Введите ваш ответ: "
        user_answer_char = gets.upcase.strip[0]

        if user_answer_char.between?("A", "D") # ответ вообще в диапазоне 
            break
        else
            puts "Отвечать только: 'A' - 'D'"
        end
    end

    # Мы сравниваем ответ с правильным
    if answers[user_answer_char] == correct_answer
        puts "Верно!"
        correct_answers = correct_answers + 1
    else 
        puts "Неверно!"
        puts "Правильный ответ - #{correct_answer}."
        incorrect_answers = incorrect_answers + 1
    end
end





    # Мы сравниваем ответ с клавиатуры