# class

# Возраст
# Вес
# кличка

class Animal
    @@my_class_var = "test"
    # Тело класса
    # Тут мы описываем какие атрибуты есть у животных
    # и ещё, какие методы (функции) они могут реализовать 

    def initialize(name, age) # метод, который вызывается при создании нового животного
        # name - это переменная (аргумент метода), которая существует только пока работает метод
        # puts name # name - это локальная переменная
        # сохраняем его ЛИЧНОЕ имя
        @name = name # переменная образца класса instance variables
        @age = age
    end

    # def age # это метод
    #     if @age > 1 && @age < 5
    #         puts "Мне #{@age} года"
    #     elsif @age == 1
    #         puts "Мне #{@age} год"
    #     else 
    #         puts "Мне #{@age} лет"
    #     end
    # end

    def age 
        # Вернуть переменную age
        return @age
        # после return не выдводятся данные
    end

    def age=(new_age)
        @age = new_age
    end

    # def birthday 
    #     @age = @age + 1
    # end

    def between? # ожидают возвращает true иди false
        puts "Hi!"
    end

    def this_is_method

    end
end

# Порождаем образец (экземпляр) этого класса
animal1 = Animal.new("Kotopes", 3) # создаём новое животное и запускаем метод initialize
animal2 = Animal.new("Pesokot", 1)
animal3 = Animal.new("Mousekot", 5)


animal1_age = animal1.age
puts "Возраст животного номер 1: #{animal1_age}"








# animal1.age
# animal1.age = 4
# animal1.age

# animal1.new_age(4)

# animal1.age
# animal1.birthday
# animal1.age


# animal1.age
# animal2.age
# animal3.age

# puts animal1.between?

# # monkey-patching
# class String
#     #переоткрываем уже существующий
#     def downcase
#         puts "lol"
#     end
# end


