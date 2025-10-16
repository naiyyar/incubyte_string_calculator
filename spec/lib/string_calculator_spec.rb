describe StringCalculator do
  describe '.add' do
    context 'When empty string is given' do
      it 'Should return 0' do
        expect(described_class.add("")).to eq 0
      end
    end

    context 'When single number is given' do
      it 'Should return the same number' do
        expect(described_class.add('1')).to eq 1
      end
    end

    context 'When two comma seperated numbers are given' do
      it 'Should return the sum of numbers' do
        expect(described_class.add('1,5')).to eq 6
      end
    end

    context 'When there is a new line between numbers' do
      it 'Should return sum of numbers 12' do
        expect(described_class.add("3\n4,6")).to eq 13
      end
    end

    context 'Handle different delimiters' do
      it 'Should return 3' do
        expect(described_class.add("//;\n1;2")).to eq(3)
      end
    end

    context 'Handling negative numbers' do
      it "raises an exception for a single negative number" do
        expect { described_class.add("1,-2,3") }.to raise_error(NegativeNumberError, "negative numbers not allowed -2")
      end
    end

    it "raises an exception for multiple negative numbers" do
      expect { described_class.add("1,-2,-3,4") }.to raise_error(NegativeNumberError, "negative numbers not allowed -2, -3")
    end
  end
end