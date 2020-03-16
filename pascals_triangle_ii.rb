require "rspec/autorun"


# formula for pascals triange
#   https://www.geeksforgeeks.org/pascal-triangle/
#
class PascalsTriangleII
  def create(k)
    array = []

    (0..(k)).each do |i|
      array.push(factorial(k) / (factorial(k-i) * factorial(i)))
    end

    array
  end

  def factorial(n)
    (1..n).inject(1, :*)
  end
end

RSpec.describe PascalsTriangleII do
  subject { PascalsTriangleII.new }

  describe "#create" do
    it "returns pascals triangle array" do
      expect(subject.create(3)).to eq [1, 3, 3, 1]
    end

    it "returns pascals triangle array" do
      expect(subject.create(3)).to eq [1, 3, 3, 1]
    end
  end
end
