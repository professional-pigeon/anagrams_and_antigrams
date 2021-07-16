require ('rspec')
require ('anagram_logic')

describe("#anagram_logic") do
  it("sort the word into array") do
    item_test = GramSpace.new("bike", "hike")
    item_test.define_arrays
    expect(item_test.array_word1).to(eq(["b", "i", "k", "e"]))
  end
  it("compare the two arrays and return true if word 1 has all the letters of word 2") do
    item_test = GramSpace.new("bike", "bikes")
    item_test.define_arrays
    expect(item_test.anagram?).to(eq(true))
  end
end