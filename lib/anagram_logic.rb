require ('pry')

class GramSpace
  VOWELS = ["a", "e", "i", "o", "u", "y"]
  attr_reader(:array_word1, :array_word2, :common_letters)
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
    bool_to_print = false
    array_of_words = @word1.downcase.split(' ') + @word2.downcase.split(' ')
    array_of_words.each do |word|
      bool_to_print = false
      VOWELS.each do |vowel|
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
    common_letters = []
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
    @common_letters = common_letters.join(" and ")
    anagram_bool
  end

  def antigram?
    antigram_bool = true
    @array_word1.each do |char|
      if @array_word2.include?(char)
        antigram_bool = false
      end
    end
    @array_word2.each do |char|
      if @array_word1.include?(char)
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
      elsif anagram?
        return "#{@word1} and #{@word2} are anagrams"
      else
        return "Looks like your words aren't antigrams or an anagrams"
      end
    else
      return "please try again with two real words you trickster."
    end
  end
end