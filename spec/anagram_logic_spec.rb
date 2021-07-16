require ('rspec')
require ('anagram_logic.rb')

describe("#anagram_logic") do
  it("sort the word into array") do
    expect(object.array_first).to(eq([h,e,r,e]))
  end
end