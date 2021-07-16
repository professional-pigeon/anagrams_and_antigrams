#!/usr/bin/ruby
require('./lib/anagram_logic')

puts "Hello! If you give us two words or sentences we'll tell you whether they are antigrams or anagrams, or neither"
input = "Y"
while input == "Y"
puts "please enter your first word or sentence"
word1 = gets.chomp
puts "please enter your second word or sentence"
word2 = gets.chomp
gram_object = GramSpace.new(word1, word2)
puts "\n#{gram_object.method_chain}!\nIf you'd like to try this out again please enter aY or enter anything else to end the program"
input = gets.chomp
end