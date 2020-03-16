require "rspec/autorun"

class MinStack
  def initialize
    @stack = []
  end

  def push(element)
    @stack.push(element)
  end

  def pop
    @stack.pop
  end

  def top
    @stack.last
  end

  def getMin
    @stack.min
  end

  def to_a
    @stack
  end
end

RSpec.describe MinStack do
  subject { MinStack.new }

  describe "#push" do
    it "push element onto stack" do
      subject.push(4)
      expect(subject.to_a).to eq [4]
    end
  end

  describe "#pop" do
    it "removes the element on top of the stack" do
      subject.push(-2)
      subject.pop
      expect(subject.to_a).to eq []
    end
  end

  describe "#top" do
    it "get the top element" do
      subject.push(1)
      subject.push(0)
      expect(subject.top).to eq 0
    end
  end

  describe "#getMin" do
    it "gets the minimum element" do
      subject.push(0)
      subject.push(1)
      subject.push(2)
      subject.push(3)
      expect(subject.getMin).to eq 0
    end
  end
end
