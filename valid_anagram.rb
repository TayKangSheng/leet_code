require "rspec/autorun"
require "byebug"

class ValidAnagram
  # @param {String} s
  # @param {String} t
  # @return {Boolean}
  def is_anagram(s, t)
    s.chars.sort == t.chars.sort
  end
end

RSpec.describe ValidAnagram do
  describe "#is_anagram" do
    it "test case 1" do
      s = "anagram"
      t = "nagaram"

      expect(subject.is_anagram(s, t)).to eq true
    end

    it "test case 2" do
      s = "rat"
      t = "car"

      expect(subject.is_anagram(s,t)).to eq false
    end
  end
end
