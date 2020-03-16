require "rspec/autorun"

class TwoSumII
  def initialize(numbers)
    @array = numbers
  end

  def get_indices(target)
    last_index = @array.length - 1

    (0..last_index-1).each do |i|
        (i..last_index).each do |j|
          return [i + 1, j + 1] if @array[i] + @array[j] == target
        end
    end
  end
end

RSpec.describe TwoSumII do
  let(:numbers) { [2, 7, 11, 15] }
  subject { TwoSumII.new(numbers) }

  describe "#get_indices" do
    it "returns 2 indices that adds up to target value" do
      expect(subject.get_indices(9)).to eq [1, 2]
    end
  end
end
