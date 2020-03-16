

class ReverseInteger
  def reverse(x)
    is_negative = x < 0

    num_string = x.abs.to_s

    reversed_value = is_negative ?
                      ("-" + num_string.reverse).to_i :
                      num_string.reverse.to_i

    return 0 if (reversed_value > 2 ** 31) || (reversed_value < -2 ** 31)
    reversed_value
  end
end

RSpec.describe ReverseInteger, "#reverse" do
  subject { ReverseInteger.new }
  it "case 1, 0" do
    expect(subject.reverse(0)).to eq 0
  end

  it "case 2, 123" do
    expect(subject.reverse(123)).to eq 321
  end

  it "case 3, -123" do
    expect(subject.reverse(-123)).to eq(-321)
  end

  it "case 4, 120" do
    expect(subject.reverse(120)).to eq 21
  end

  it "case 5, 2 ** 31" do
    expect(subject.reverse(2 ** 31)).to eq 0
  end

  it "case 6, -2 ** 31" do
    expect(subject.reverse(-2 ** 31)).to eq 0
  end

  it "case 7, 1534236469" do
    expect(subject.reverse(1534236469)).to eq(0)
  end
end
