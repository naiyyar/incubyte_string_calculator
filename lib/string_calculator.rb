class NegativeNumberError < StandardError; end

class StringCalculator

  def self.add str = ""
    return 0 if str.empty?

    delimiter = ','

    if str.start_with?('//')
      delimiter_str, str = str.split("\n")
      delimiter = delimiter_str[2..]
    end

    str = str.gsub("\n", delimiter) if str.include?("\n")

    number_array = str.split(delimiter).map(&:to_i)

    negative_numbers = number_array.select { |num| num < 0 }
    
    unless negative_numbers.empty?
      raise NegativeNumberError, "negative numbers not allowed #{negative_numbers.join(', ')}" 
    end
    
    number_array.sum
  end
end