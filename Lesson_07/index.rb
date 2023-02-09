# class

# Возраст
# Вес
# кличка

class Animal
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

    def age # это метод
        puts "Мне #{@age} лет"
    end
end

# Порождаем образец (экземпляр) этого класса
animal1 = Animal.new("Kotopes", 3) # создаём новое животное и запускаем метод initialize
animal2 = Animal.new("Pesokot", 2)

puts animal1.age