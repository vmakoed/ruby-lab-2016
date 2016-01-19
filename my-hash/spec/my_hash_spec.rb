require 'my_hash'

describe MyHash do
  let (:hash) { MyHash.new }

  describe '#[key] = value' do
    it "assigns value to key ':apple'" do
      hash[:apple] = 1
      expect(hash[:apple]).to eq(1)
    end

    it "assigns value to key ':banana'" do
      hash[:banana] = 2
      expect(hash[:banana]).to eq(2)
    end

    it 'assigns value to existing key overwriting previous value' do
      hash[:cherry] = 3
      hash[:cherry] = 4
      expect(hash[:cherry]).to eq(4)
    end
  end

  before(:each) do
    hash[:apple] = 1
    hash[:banana] = 2
    hash[:cherry] = 3
  end

  describe '#[key]' do
    it 'returns 1' do
      expect(hash[:apple]).to eq(1)
    end

    it 'returns 2' do
      expect(hash[:banana]).to eq(2)
    end

    it 'returns 3' do
      expect(hash[:cherry]).to eq(3)
    end
  end

  describe '#keys' do
    it 'returns keys' do
      expect(hash.keys).to eq('[apple, banana, cherry]')
    end
  end

  describe '#values' do
    it 'returns values' do
      expect(hash.values).to eq('[1, 2, 3]')
    end
  end

  describe 'size' do
    it 'returns size' do
      expect(hash.size).to eq(3)
    end
  end

  describe 'clear' do
    it 'clears hash' do
      hash.clear
      expect(hash.size).to eq(0)
      expect(hash.keys).to eq('[]')
      expect(hash.values).to eq('[]')
    end
  end

  describe 'empty?' do
    it 'checks if hash is empty' do
      expect(hash.empty?).to be false
      hash.clear
        expect(hash.empty?).to be true
    end
  end
end
