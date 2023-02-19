class Animal
    attr_accessor :age, :name

    def speak
        puts "Общий класс"
    end
end

class Dog < Animal
    def speak
        puts "Gav"
    end

    def eat(amount)
        if amount > 0.5
            puts "Я столько не съем!"
        else
            puts "Очень вкусно!"
        end
    end
end

class SmallDog < Dog

end


class Cat < Animal
    def speak
        puts "Meov"
    end

    def eat(amount)
        if amount > 0.3
            puts "Я столько не съем!"
        else
            puts "Очень вкусно!"
        end
    end
end

dog = Dog.new
dog.speak
dog.eat(10)
dog.eat(0.1)


animal = Animal.new
animal.speak
