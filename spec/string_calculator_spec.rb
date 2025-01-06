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

    it 'handles newlines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
      expect(StringCalculator.add("1\n2,3,4\n5\n6")).to eq(21)
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
      expect(StringCalculator.add("//:\n1:2:3:4")).to eq(10)
    end

  end
end
