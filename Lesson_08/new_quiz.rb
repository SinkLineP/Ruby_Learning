require "yaml"

a_code = "A".ord #65
correct_answers = 0
incorrect_answers = 0

# Ввести имя с клавиатуры
print "Enter your name: "
username = gets.strip
current_time = Time.now.strftime("%Y-%m-%d_%H:%M:%S")

filename = "QUIZ_#{username}_#{current_time}.txt"

# протокол
File.write(
    filename, 
    "Результаты для пользователя #{username}.\n\n#{current_time}", 
    mode: "a" # Открыть для записи и дописывать контент в конец файла!
)

# Откуда-то взять вопросы и ответы
# YAML

all_questions = YAML.safe_load_file("quetion.yml", symbolize_names: true) #читаем файл
# puts all_questions.inspect

# Брать каждый вопрос по очереди и предлагать 4 варинта ответа

all_questions.shuffle.each do |question_data|
    formatted_question = "\n\n=== #{question_data[:question]} ===\n\n"
    puts formatted_question 

    # протокол
    File.write(
        filename, 
        formatted_question, 
        mode: "a" # Открыть для записи и дописывать контент в конец файла!
    )

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

    File.write(
        filename, 
        "Ответ пользователя #{answers[user_answer_char]}\n\n", 
        mode: "a" # Открыть для записи и дописывать контент в конец файла!
    )

    # Мы сравниваем ответ с правильным
    if answers[user_answer_char] == correct_answer
        puts "Верно!"
        correct_answers = correct_answers + 1

        File.write(
            filename, 
            "Верно!", 
            mode: "a" # Открыть для записи и дописывать контент в конец файла!
        )
    else 
        puts "Неверно!"
        puts "Правильный ответ - #{correct_answer}."
        incorrect_answers = incorrect_answers + 1

        File.write(
            filename, 
            "Неверно! Правильный ответ - #{correct_answer}.", 
            mode: "a" # Открыть для записи и дописывать контент в конец файла!
        )
    end
end

File.write(
    filename, 
    "\n\nПравильных ответов: #{correct_answers}", 
    mode: "a" # Открыть для записи и дописывать контент в конец файла!
)

File.write(
    filename, 
    "\n\nНеправильных ответов: #{incorrect_answers}", 
    mode: "a" # Открыть для записи и дописывать контент в конец файла!
)

correct_answer_percentage = (correct_answers / all_questions.length.to_f) * 100

File.write(
    filename, 
    "\n\nПроцент правильных ответов: #{correct_answer_percentage.floor()} %", 
    mode: "a" # Открыть для записи и дописывать контент в конец файла!
)

