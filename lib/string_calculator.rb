class StringCalculator

  def self.add str = ""
    return 0 if str.empty?

    return str.to_i if str.length == 1

    delimiter = ','

    if str.start_with?('//')
      delimiter_str, str = str.split("\n")
      delimiter = delimiter_str[2..]
    end

    str = str.gsub("\n", delimiter) if str.include?("\n")

    str.split(delimiter).map(&:to_i).sum
  end
end