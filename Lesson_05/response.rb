require "faraday"
require "json"

url = "https://jsonplaceholder.typicode.com/posts"

res = Faraday.get(
    url, 
    {max_results: 12},
)

all_data = JSON.parse(res.body)
data_titles = all_data.map do |title|
    title["title"]
end

print "enter youre string to search: "
user_input = gets.strip.downcase

found_title = data_titles.select do |title|
    title.downcase.include?(user_input)
end

puts found_title.first
# titles = all_data['title'].map {|t| t["title"]} 
# puts titles