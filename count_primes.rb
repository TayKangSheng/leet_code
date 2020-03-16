require "rspec/autorun"
require "byebug"
require "prime"

class CountPrimes
  def count(n)
    prime_count = 0

    (0...n).each do |num|
      prime_count += 1 if ::Prime.prime?(num)
    end

    prime_count
  end
end

RSpec.describe CountPrimes do
  describe "#count" do
    it "returns the number of prime numbers lesser than given n" do
      expect(subject.count(10)).to eq 4
      expect(subject.count(2)).to eq 0
      expect(subject.count(999983)).to eq 0
    end
  end
end
