class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter = /,|\n/
    numbers = input.split(/#{delimiter}/).map(&:to_i)
    numbers.sum
  end
end
