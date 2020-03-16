# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  if root == nil
    return 0
  elsif root.left == nil && root.right == nil
    return 1
  elsif root.left == nil || root.right == nil
    return 1 + max_depth(root.left) if root.right == nil
    return 1 + max_depth(root.right) if root.left == nil
  else
    return 1 + [max_depth(root.left), max_depth(root.right)].max
  end
end

describe "#max_depth" do
  it "test case 1, [3,9,20,nil,nil,15,7]" do
    #    3
    #   / \
    #  9  20
    #    /  \
    #   15   7
    root = TreeNode.new(3)
    root.left = TreeNode.new(9)
    root.right = TreeNode.new(20)
    root.right.left = TreeNode.new(15)
    root.right.right = TreeNode.new(7)

    expect(max_depth(root)).to eq(3)
  end

  it "test case 2, []" do
    root = nil

    expect(max_depth(root)).to eq(0)
  end

  it "test case 3, [1, 2]" do
    root = TreeNode.new(1)
    root.left = TreeNode.new(2)

    expect(max_depth(root)).to eq(2)
  end
end
