data = {
    Russia: "Москва",
    China: "Пекин",
    France: "Париж",
    Canada: "Оттава",
    GreatBritain: "Лондон",
    Norway: "Осло"
}


def error_value(capital_meesage, count) 
    puts "=============================="
    puts "Ошибка!"
    puts "Правильный ответ: #{capital_meesage}"
end

def show_country(country)
    puts "=============================="
    puts "Страна - #{country}"
end

def empty_value(country_message)
    puts "=============================="
    puts "Вы ввели пустое значение!"
    show_country(country_message)
end

def enter_user_value()
    print "Введите столицу страны: "
end

def success()
    puts "=============================="
    puts "Молодец!"

end




data.to_a.shuffle.to_h.each do |country, capital|
    show_country(country)
    enter_user_value()
    user_input = gets.strip.downcase
    

    if user_input == capital.downcase
        success()
    elsif user_input == ""
        while user_input == ""
            empty_value(country)
            enter_user_value()
            user_input = gets.strip.downcase
       
            if user_input == capital.downcase
                success()
            else
                error_value(capital)
            end
        end
    else
        error_value(capital)
    end
end
