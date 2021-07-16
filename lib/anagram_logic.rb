require ('pry')

class GramSpace
  attr_reader(:array_word1, :array_word2)
  def initialize(word1, word2)
    @word1 = word1
    @word2 = word2
  end

  def define_arrays
    array_word1 = @word1.downcase.split('')
    array_word2 = @word2.downcase.split('')
    @array_word1 = array_word1.reject {|letter| letter == " " || letter == "." || letter == "," || letter == "?" || letter == "!"}
    @array_word2 = array_word2.reject {|letter| letter == " " || letter == "." || letter == "," || letter == "?" || letter == "!"}
  end

  def valid_word?
    vowels = ["a", "e", "i", "o", "u", "y"]
    bool_to_print = false
    array_of_words = @word1.downcase.split(' ') + @word2.downcase.split(' ')
    array_of_words.each do |word|
      bool_to_print = false
      vowels.each do |vowel|
        if word.include?(vowel) == true
          bool_to_print = true
          break
        end
      end
      if bool_to_print == false
        break
      end
    end
    bool_to_print
  end
  
  def anagram?
    anagram_bool = true
    @array_word1.each do |char|
      if @array_word2.include?(char) == false
        anagram_bool = false
      end
    end
    @array_word2.each do |char|
      if @array_word1.include?(char) == false
        anagram_bool = false
      end
    end
    anagram_bool
  end

  def antigram?
    antigram_bool = true
    @array_word1.each do |char|
      if @array_word2.include?(char) == true
        antigram_bool = false
      end
    end
    @array_word2.each do |char|
      if @array_word1.include?(char) == true
        antigram_bool = false
      end
    end
    antigram_bool
  end

  def method_chain
    define_arrays
    if valid_word?
      if antigram?
        return "#{@word1} and #{@word2} are antigrams"
      end
      if anagram?
        return "#{@word1} and #{@word2} are anagrams"
      end
    else
      return "please try again with two real words you trickster."
    end
  end
end