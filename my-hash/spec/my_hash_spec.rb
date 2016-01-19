require 'my_hash'

describe MyHash do
  let (:hash) { MyHash.new }
  describe '#[key]' do
    before do
      hash[:apple] = 1
      hash[:banana] = 2
    end

    it 'returns 1' do
      expect(hash[:apple]).to eq(1)
    end

    it 'returns 2' do
      expect(hash[:banana]).to eq(2)
    end
  end
end
