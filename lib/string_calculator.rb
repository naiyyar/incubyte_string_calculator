class StringCalculator
  class NegativeNumberError < StandardError; end

  def self.add str = ""
    return 0 if str.empty?

    delimiter = ','

    if str.start_with?('//')
      delimiter_str, str = str.split("\n")
      delimiter = delimiter_str[2..]
    end

    str = str.gsub("\n", delimiter) if str.include?("\n")

    numbers_array = str.split(delimiter).map(&:to_i)
    
    check_for_negatives!(numbers_array)
    
    numbers_array.sum
  end

  private

  def self.check_for_negatives!(numbers)
    negatives = numbers.select(&:negative?)
    return if negatives.empty?

    raise NegativeNumberError, "negative numbers not allowed: #{negatives.join(', ')}"
  end
end
