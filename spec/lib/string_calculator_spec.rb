describe StringCalculator do
  describe '.add' do
    context 'When empty string is given' do
      it 'Should return 0' do
        expect(described_class.add("")).to eq 0
      end
    end
  end
end