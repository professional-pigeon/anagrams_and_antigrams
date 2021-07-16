require ('pry')

class GramSpace
  attr_reader(:array_word1, :array_word2)
  def initialize(word1, word2)
    @word1 = word1
    @word2 = word2
  end

  def define_arrays
    @array_word1 = @word1.split('')
    @array_word2 = @word2.split('')
  end
  
  def anagram?
    define_arrays
    is_anagram = true
    @array_word1.each do |char|
      if @array_word2.include?(char) === false
        is_anagram = false
      end
    end
    @array_word2.each do |char|
      if @array_word1.include?(char) === false
        is_anagram = false
      end
    end
    is_anagram
  end

end