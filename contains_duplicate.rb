require "rspec/autorun"

class ContainsDuplicate
  # # @param {Integer[]} nums
  # # @return {Boolean}
  # # Time Limit Exceeded
  # def contains_duplicate(nums)
  #   set = []
  #
  #   nums.each do |n|
  #     return true if set.include?(n)
  #
  #     set.push(n)
  #   end
  #
  #   false
  # end

  # # @param {Integer[]} nums
  # # @return {Boolean}
  # def contains_duplicate(nums)
  #   nums.sort!
  #
  #   prev = nil
  #   nums.each do |n|
  #     return true if n == prev
  #
  #     prev = n
  #   end
  #
  #   false
  # end

  # @param {Integer[]} nums
  # @return {Boolean}
  def contains_duplicate(nums)
    set = {}

    nums.each do |n|
      return true if set.has_key?(n.to_s)

      set[n.to_s] = 1
    end

    false
  end
end

RSpec.describe ContainsDuplicate do
  describe "#contains_duplicate" do
    it "test case 1" do
      nums = [1,2,3,1]
      expect(subject.contains_duplicate(nums)).to eq true
    end

    it "test case 2" do
      nums = [1,2,3,4]
      expect(subject.contains_duplicate(nums)).to eq false
    end

    it "test case 3" do
      nums = [1,1,1,3,3,4,3,2,4,2]
      expect(subject.contains_duplicate(nums)).to eq true
    end
  end
end
