require ('rspec')
require ('anagram_logic')

describe("#anagram_logic") do
  it("sort the word into array") do
    item_test = GramSpace.new("bi ke", "hike")
    item_test.define_arrays
    expect(item_test.array_word1).to(eq(["b", "i", "k", "e"]))
  end
  it("compare the two arrays and return true if word 1 has all the letters of word 2") do
    item_test = GramSpace.new("bike", "bike")
    item_test.define_arrays
    expect(item_test.anagram?).to(eq(true))
  end
  it("compare the two arrays and return true if true anagram") do
    item_test = GramSpace.new("listen", "silent")
    item_test.define_arrays
    expect(item_test.anagram?).to(eq(true))
  end
  it("compare the two arrays and return true if true anagram if casing is different") do
    item_test = GramSpace.new("listEN", "siLent")
    item_test.define_arrays
    expect(item_test.anagram?).to(eq(true))
  end
  it("will ask you to put in a word if the 'words' entered are strings of consonants") do
    item_test = GramSpace.new("httw", "wtph")
    expect(item_test.valid_word_vowel?).to(eq(false))
  end
  it("will remove spacing and punctuation from a word or words") do
    item_test = GramSpace.new("bi ke?", "hike")
    item_test.define_arrays
    expect(item_test.array_word1).to(eq(["b", "i", "k", "e"]))
  end
  it("will tell you if you've got an antigram on your hands") do
    item_test = GramSpace.new("bike", "cow")
    item_test.define_arrays
    expect(item_test.antigram?).to(eq(true))
  end
  it("will return a statement for an antigram") do
    item_test = GramSpace.new("bike", "cow")
    expect(item_test.method_chain).to(eq("bike and cow are antigrams"))
  end
  it("will tell you false if a word in a sentence is not an valid word") do
    item_test = GramSpace.new("bikes are fun to ppppl.", "cow")
    expect(item_test.valid_word_vowel?).to(eq(false))
  end
  it("will tell you which letters were in common if it was not an anagram") do
    item_test = GramSpace.new("bow", "cow")
    item_test.method_chain
    expect(item_test.common_letters).to(eq("o, w"))
  end
  it("will tell you the 'words' entered are false if they contain three of the same consonant in a row") do
    item_test = GramSpace.new("pppa", "wake")
    expect(item_test.valid_word_consonants?).to(eq(false))
  end
  it("will tell you the 'words' entered are false if they are 1 letter long and aren't 'i' or 'a'.") do
    item_test = GramSpace.new("b", "wake")
    expect(item_test.valid_word_by_length?).to(eq(false))
  end
end