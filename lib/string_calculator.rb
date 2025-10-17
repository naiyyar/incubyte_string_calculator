class StringCalculator
  class NegativeNumberError < StandardError; end

  DEFAULT_DELIMITER = ','

  def self.add str = ""
    return 0 if str.empty?

    delimiter, str = split_delimiter_and_numbers(str)

    str = str.gsub("\n", delimiter) if str.include?("\n")

    numbers_array = str.split(delimiter).map(&:to_i)
    
    check_for_negatives!(numbers_array)
    
    numbers_array.sum
  end

  private

  def self.split_delimiter_and_numbers(str)
    if str.start_with?('//')
      delimiter_str, number_str = str.split("\n")
      [delimiter_str[2..], number_str]
    else
      [DEFAULT_DELIMITER, str]
    end
  end

  def self.check_for_negatives!(numbers)
    negatives = numbers.select(&:negative?)
    return if negatives.empty?

    raise NegativeNumberError, "negative numbers not allowed: #{negatives.join(', ')}"
  end
end
