require "rspec/autorun"
require "byebug"

class MaximumSubarray
  # # @param {Integer[]} nums
  # # @return {Integer}
  # def max_sub_array(nums)
  #   return 0 if nums.length == 0
  #   return nums.first if nums.length == 1
  #
  #   sum = -99999
  #
  #   (1..nums.length).each do |window_size|
  #     # p "window_size: #{window_size}"
  #     (0..(nums.length-window_size)).each do |start_index|
  #       current_sum = nums[start_index..(start_index+window_size-1)].sum
  #       sum = current_sum if current_sum > sum
  #     end
  #   end
  #   sum
  # end

  # @param {Integer[]} nums
  # @return {Integer}
  def max_sub_array(nums)
    current_sum = -1.0/0.0
    best_sum = -1.0/0.0

    nums.each do |i|
      current_sum = [i, current_sum + i].max
      best_sum = [best_sum, current_sum].max
    end

    best_sum
  end
end

RSpec.describe MaximumSubarray do
  describe "#max_sub_array" do
    it "test case 1" do
      nums = [-2,1,-3,4,-1,2,1,-5,4]

      expect(subject.max_sub_array(nums)).to eq 6
    end

    it "test case 2" do
      nums = [-1]

      expect(subject.max_sub_array(nums)).to eq(-1)
    end

    it "test case 3" do
      nums = [-2, -1]

      expect(subject.max_sub_array(nums)).to eq(-1)
    end

    it "test case 4" do
      nums = [-2147483647]

      expect(subject.max_sub_array(nums)).to eq(-2147483647)
    end

    it "test case 5" do
      nums = [-2, -3, -1, -4, 0]

      expect(subject.max_sub_array(nums)).to eq(-2)
    end
  end
end
