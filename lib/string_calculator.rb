class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter = /,|\n/
    if input.start_with?("//")
      delimiter, input = input.match(%r{//(.+)\n(.*)}).captures
      delimiter = Regexp.escape(delimiter)
    end

    numbers = input.split(/#{delimiter}/).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }

    raise "Negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?
    numbers.sum
  end
end
