# member1 = "stan"
# member2 = "death knight"
# # member3 = "black"

# array_members = ["stan", "death knight", "black"]
# # puts array_members[0]

# array_members.each do |member|
#     puts "Name of band - #{member}"
# end

#===============RAND=ELEMENT=OF=ARRAY===============

# array_words = [
#     "Hello",
#     "Minecraft",
#     "Games",
#     "Videos",
#     "ARK",
#     "YouTube"
# ]

# random_index = (rand * array_words.length).to_i

# puts array_words[random_index]

#=============Number=in=Squares=================

# array_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# new_array_numbers = []

# array_numbers.each do |number|
#     new_array_numbers.push(number ** 2)
# end

# puts new_array_numbers

# ====================One=Rand=Element=of=Array================

array_words = [
    "Hello",
    "Minecraft",
    "Games",
    "Videos",
    "ARK",
    "YouTube"
]

variant_1 = array_words[(rand * array_words.length - 1).to_i]
variant_2 = array_words.shuffle.first
variant_3 = array_words.sample

# variant number 1
puts "Variant 1 - #{variant_1}"

# variant number 2
puts "Variant 2 - #{variant_2}"

# variant number 3
puts "Variant 3 - #{variant_3}"

if (variant_1 == variant_2) && (variant_1 == variant_3)
    puts "You CraZy!!!"
end


# =========Shuffle==========

# array_numbers = (1..10).to_a
# print array_numbers
# puts ""
# new_array = array_numbers.shuffle
# print new_array

