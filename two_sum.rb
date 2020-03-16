require "rspec/autorun"

class TwoSum
  def get_indexes(array, target)
    last_index = array.length - 1

    (0..last_index).each do |i|
      ((i+1)..last_index).each do |j|
        return [i, j] if array[i] + array[j] == target
      end
    end
  end
end

RSpec.describe TwoSum do
  it "should return index of two numbers such that they add up to target" do
    expect(subject.get_indexes([2, 7, 11, 15], 9)).to eq [0, 1]
    expect(subject.get_indexes([2, 7, 11, 15], 26)).to eq [2, 3]
    expect(subject.get_indexes([3, 2, 4], 6)).to eq [1, 2]
  end
end
