require "rspec/autorun"
require "byebug"

class ProductOfArrayExceptSelf
  # @param {Integer[]} nums
  # @return {Integer[]}
  def product_except_self(nums) # [1, 2, 3, 4]
    left_to_right = [] # [nil, 1, 2, 6]

    nums.each_with_index do |n, index|
      if index == 0
        left_to_right[index] = nil
      elsif index == 1
        left_to_right[index] = nums[index - 1]
      else
        left_to_right[index] = nums[index - 1] * left_to_right[index - 1]
      end
    end

    right_to_left = [] # [nil, 4, 12, 24]

    nums.reverse.each_with_index do |n, index|
      if index == 0
        right_to_left[index] = nil
      elsif index == 1
        right_to_left[index] = nums[nums.length - index]
      else
        right_to_left[index] = right_to_left[index - 1] * nums[nums.length - index]
      end
    end
    right_to_left.reverse!

    (0...nums.length).map do |index|
      if index == 0
        right_to_left[index]
      elsif index == nums.length - 1
        left_to_right[index]
      else
        right_to_left[index] * left_to_right[index]
      end
    end
  end
end

# Time Complexity
#   O(N): N to construct left_to_right, N to construct right_to_left
#         N to construct final
#
# Space Complexity
#   O(N): N to construct left_to_right, N to construct right_to_left
#         N to construct final

RSpec.describe ProductOfArrayExceptSelf do
  describe "#product_except_self" do
    it "test case 1" do
      result = subject.product_except_self([1,2,3,4])

      expect(result).to eq [24,12,8,6]
    end
  end
end
