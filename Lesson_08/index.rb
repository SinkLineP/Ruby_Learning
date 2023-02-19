class Animal 
    attr_accessor :age # создание метода age
    attr_reader :name # метод только для чтения!
    attr_writer :name # метод для изменения!

    def initialize(name, age) # метод, который вызывается при создании нового животного
        @name = name # name - это переменная (аргумент метода), существует пока работает метод
        @age = age 
    end
end

animal1 = Animal.new("Kotopes", 3) # создаем новое животное и запускаем метод initialize


