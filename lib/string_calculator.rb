class StringCalculator

  def self.add str = ""
    return 0 if str.empty?

    return str.to_i if str.length == 1

    if str.include?("\n")
      str.gsub("\n", ',').split(',').map(&:to_i).sum
    else
      str.split(',').map(&:to_i).sum
    end
  end
end