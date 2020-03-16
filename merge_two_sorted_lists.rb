require "rspec/autorun"
require "byebug"

class MergeTwoSortedLists
  def merge(arr1, arr2)
    buffer = []

    while arr1.length > 0 || arr2.length > 0
      if arr1.length > 0 && arr2.length > 0
        buffer.push(arr1[0] < arr2[0] ? arr1.shift : arr2.shift)
      elsif arr1.length > 0
        buffer.push(arr1.pop)
      else # arr2.length > 0
        buffer.push(arr2.pop)
      end
    end

    buffer
  end

  def merge_sort(arr1, arr2)
    (arr1 + arr2).sort
  end
end

RSpec.describe MergeTwoSortedLists do
  subject { MergeTwoSortedLists.new }
  let(:array1) { [1, 2, 4] }
  let(:array2) { [1, 3, 4] }

  describe "#merge" do
    it "should return a sorted list" do
      expect(subject.merge(array1, array2)).to eq [1, 1, 2, 3, 4, 4]
    end
  end

  describe "#merge_sort" do
    it "should return a sorted list" do
      expect(subject.merge_sort(array1, array2)).to eq [1, 1, 2, 3, 4, 4]
    end
  end
end
