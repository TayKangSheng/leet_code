require "rspec/autorun"

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end

class MergeTwoBinaryTree
  # @param {TreeNode} t1
  # @param {TreeNode} t2
  # @return {TreeNode}
  def merge_trees(t1, t2)
    if t1.nil? || t2.nil?
      return t1 || t2
    else
      # both have values
      t1.val = t1.val + t2.val
      t1.left = merge_trees(t1.left, t2.left)
      t1.right = merge_trees(t1.right, t2.right)

      return t1
    end
  end
end

RSpec.describe MergeTwoBinaryTree do
  subject { MergeTwoBinaryTree.new }

  describe "#merge_trees" do
    it "test case 1" do
      #   Input:
      # 	Tree 1                     Tree 2
      #           1                         2
      #          / \                       / \
      #         3   2                     1   3
      #        /                           \   \
      #       5                             4   7
      # Output:
      # Merged tree:
      # 	     3
      # 	    / \
      # 	   4   5
      # 	  / \   \
      # 	 5   4   7
      t1 = TreeNode.new(1)
      t1.left = TreeNode.new(3)
      t1.left.left = TreeNode.new(5)
      t1.right = TreeNode.new(2)

      t2 = TreeNode.new(2)
      t2.left = TreeNode.new(1)
      t2.left.right = TreeNode.new(4)
      t2.right = TreeNode.new(3)
      t2.right.right = TreeNode.new(7)

      t = subject.merge_trees(t1, t2)

      expect(t.val).to eq 3
      expect(t.left.val).to eq 4
      expect(t.left.left.val).to eq 5
      expect(t.left.right.val).to eq 4
      expect(t.right.val).to eq 5
      expect(t.right.right.val).to eq 7
    end
  end
end
