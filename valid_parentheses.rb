require "rspec/autorun"
require "byebug"

class ValidParenthesis
  def check(string)
    buffer = []

    string.each_char do |c|
      case c
      when "{", "[", "("
        buffer = buffer.push(c)
      when "}"
        return false if buffer.pop != "{"
      when "]"
        return false if buffer.pop != "["
      when ")"
        return false if buffer.pop != "("
      end
    end

    buffer.empty? ? true : false
  end
end

RSpec.describe ValidParenthesis do
  let(:subject) { ValidParenthesis.new }

  it "returns true if valid" do
    expect(subject.check("()")).to eq true
    expect(subject.check("()[]{}")).to eq true
    expect(subject.check("{[]}")).to eq true
  end

  it "returns false if not valid" do
    expect(subject.check("(]")).to eq false
    expect(subject.check("(])]")).to eq false
    expect(subject.check("[")).to eq false
  end
end
