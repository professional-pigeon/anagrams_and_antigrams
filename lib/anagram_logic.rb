require ('pry')

class GramSpace
  attr_reader(:array_word1, :array_word2)
  def initialize(word1, word2)
    @word1 = word1
    @word2 = word2
  end

  def define_arrays
    @array_word1 = @word1.downcase.split('')
    @array_word2 = @word2.downcase.split('')
  end
end