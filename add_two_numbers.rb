require "byebug"

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

class AddTwoNumbers
  # @param {ListNode} l1
  # @param {ListNode} l2
  # @return {ListNode}
  def add_two_numbers(l1, l2)
    dummy_head = ListNode.new(0)

    p = l1
    q = l2
    current = dummy_head
    carry = 0

    while p != nil || q != nil
      p_val = p ? p.val : 0
      q_val = q ? q.val : 0
      sum = p_val + q_val + carry

      current.next = ListNode.new(sum % 10)
      carry = sum / 10

      p = p ? p.next : nil
      q = q ? q.next : nil
      current = current.next
    end

    if carry > 0
      current.next = ListNode.new(carry)
    end

    dummy_head.next
  end

  # def add_two_numbers(l1, l2)
  #   l3_array = []
  #
  #   l1_current = l1
  #   l2_current = l2
  #
  #   while l1_current || l2_current
  #     l1_val = l1_current ? l1_current.val : 0
  #     l2_val = l2_current ? l2_current.val : 0
  #     sum = l1_val + l2_val
  #
  #     l3_array.push(sum)
  #
  #     l1_current = l1_current ? l1_current.next : nil
  #     l2_current = l2_current ? l2_current.next : nil
  #   end
  #
  #   # [7, 10, 7]
  #   l3_array.each_with_index do |val, index|
  #     next if val < 10
  #
  #     l3_array[index] = val % 10
  #     l3_array[index + 1] = (l3_array[index + 1] || 0) + (val / 10)
  #   end
  #
  #   l3 = nil
  #   l3_prev = nil
  #   (0..(l3_array.length - 1)).each do |index|
  #     if index == 0
  #       l3 = ListNode.new(l3_array[index])
  #       l3_prev = l3
  #     else
  #       l3_prev.next = ListNode.new(l3_array[index])
  #       l3_prev = l3_prev.next
  #     end
  #   end
  #
  #   l3
  # end
end

RSpec.describe AddTwoNumbers, "#add_two_numbers" do
  subject { AddTwoNumbers.new }

  it "test case 1" do
    l1 = ListNode.new(0)
    l2 = ListNode.new(0)

    result = subject.add_two_numbers(l1, l2)
    expect(result.val).to eq 0
  end

  it "test case 2" do
    l1 = ListNode.new(2)
    l1.next = ListNode.new(4)
    l1.next.next = ListNode.new(3)

    l2 = ListNode.new(5)
    l2.next = ListNode.new(6)
    l2.next.next = ListNode.new(4)

    result = subject.add_two_numbers(l1, l2)

    expect(result.val).to eq 7
    expect(result.next.val).to eq 0
    expect(result.next.next.val).to eq 8
  end

  it "test case 3" do
    l1 = ListNode.new(5)
    l2 = ListNode.new(5)

    result = subject.add_two_numbers(l1, l2)
    expect(result.val).to eq 0
    expect(result.next.val).to eq 1
  end

  it "test case 4" do
    l1 = ListNode.new(1)
    l1.next = ListNode.new(8)
    l2 = ListNode.new(0)

    result = subject.add_two_numbers(l1, l2)
    expect(result.val).to eq 1
    expect(result.next.val).to eq 8
  end

  it "test case 5" do
    l1 = ListNode.new(0)
    l2 = ListNode.new(1)
    l2.next = ListNode.new(8)

    result = subject.add_two_numbers(l1, l2)

    expect(result.val).to eq 1
    expect(result.next.val).to eq 8
  end

  it "test case 6" do
    l1 = nil
    l2 = ListNode.new(5)
    l2.next = ListNode.new(5)

    result = subject.add_two_numbers(l1, l2)

    expect(result.val).to eq 5
    expect(result.next.val).to eq 5
  end
end
