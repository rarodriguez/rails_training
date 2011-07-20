#The sentence "A quick brown fox jumps over the lazy dog" 
# contains every single letter in the alphabet.
#Such sentences are called pangrams.
#You are to write a function get MissingLetters, 
#which takes a String, sentence, and returns all 
#the letters that are missing (which prevent it from being a pangram). 
#You should ignore the case of the letters in sentence, 
#and your return should be all lower case letters, in alphabetical order.
#You should also ignore all non US-ASCII characters.

sentence = "A quick brown fox jumps over the laz".downcase
('a'..'z').each{|val| puts "#{val} " if !sentence.include?(val)}
