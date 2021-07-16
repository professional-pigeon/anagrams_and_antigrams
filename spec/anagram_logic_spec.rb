require ('rspec')
require ('anagram_logic')

describe("#anagram_logic") do
  it("sort the word into array") do
    item_test = GramSpace.new("bike", "hike")
    item_test.define_arrays
    expect(item_test.array_word1).to(eq(["b", "i", "k", "e"]))
  end
end