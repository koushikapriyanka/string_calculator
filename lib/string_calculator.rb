class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter = /,|\n/
    if input.start_with?("//")
      if input.match(%r{//\[(.+)\]\n(.*)}) # Matches multi-character delimiters
        delimiter, input = input.match(%r{//\[(.+)\]\n(.*)}).captures
      else
        delimiter, input = input.match(%r{//(.+)\n(.*)}).captures
      end
      delimiter = Regexp.escape(delimiter)
    end

    numbers = input.split(/#{delimiter}/).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }

    raise "Negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?
    
    numbers = numbers.reject { |n| n > 1000 }
    
    numbers.sum
  end
end
