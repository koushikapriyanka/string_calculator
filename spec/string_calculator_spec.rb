require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number when only one number is given' do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it 'returns the sum of multiple numbers separated by commas' do
      expect(StringCalculator.add("1,2,3,6")).to eq(12)
    end

    it 'returns the sum of the first 50 numbers' do
      numbers = (1..50).to_a.join(",")
      expected_sum = (1..50).sum
      expect(StringCalculator.add(numbers)).to eq(expected_sum)
    end
  end
end
