require "rspec/autorun"
require "byebug"

class BestTimeToBuyAndSellStocks
  def calculate(array)
    lowest_price = 99999999
    max_profit = 0

    array.each do |price|
      if price < lowest_price
        lowest_price = price
      elsif (price - lowest_price) > max_profit
        max_profit = price - lowest_price
      end
    end

    max_profit
  end
end

RSpec.describe BestTimeToBuyAndSellStocks do
  subject { BestTimeToBuyAndSellStocks.new }

  describe "#calulate" do
    it "test case 1" do
      test_case = [7, 1, 5, 3, 6, 4]
      expect(subject.calculate(test_case)).to eq 5
    end

    it "test case 2" do
      test_case = [7, 6, 4, 3, 1]
      expect(subject.calculate(test_case)).to eq 0
    end

    it "test case 3" do
      test_case = [2, 4, 1]
      expect(subject.calculate(test_case)).to eq 2
    end

    it "test case 4" do
      test_case = [2,1,2,1,0,1,2]
      expect(subject.calculate(test_case)).to eq 2
    end
  end
end
