require 'yaml'

class FileWriter
    def initialize(filename, mode)
        @filename = filename
        @mode = mode
    end

    def write(content)
        File.write(
            @filename,
            content,
            mode: @mode 
        )
    end
end

class Questions
    def initialize(filename)
        @filename = filename
    end

    def load
        return YAML.safe_load_file(@filename, symbolize_names: true)
    end
end

a_code = "A".ord #65
correct_answers = 0
incorrect_answers = 0

# Ввести имя с клавиатуры
print "Enter your name: "
username = gets.strip
current_time = Time.now.strftime("%Y-%m-%d_%H:%M:%S")

filename = "QUIZ_#{username}_#{current_time}.txt"


writer = FileWriter.new(filename, "a")
writer.write("Результаты для пользователя #{username}.\n\n#{current_time}")

questions = Questions.new("quetion.yml")


questions.load.shuffle.each do |question_data|
    formatted_question = "\n\n=== #{question_data[:question]} ===\n\n"
    puts formatted_question 
    writer.write(formatted_question)

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

    writer.write("Ответ пользователя #{answers[user_answer_char]}\n\n")

    # Мы сравниваем ответ с правильным
    if answers[user_answer_char] == correct_answer
        puts "Верно!"
        correct_answers = correct_answers + 1

        writer.write("Верно!")
    else 
        puts "Неверно!"
        puts "Правильный ответ - #{correct_answer}."
        incorrect_answers = incorrect_answers + 1

        writer.write("Неверно! Правильный ответ - #{correct_answer}.")
    end
end