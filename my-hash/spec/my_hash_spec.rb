require 'my_hash'

describe MyHash do
  let (:hash) { MyHash.new }

  describe '#[key] = value' do
    it "assigns value to key ':apple'" do
      hash[:apple] = 1
      expect(hash[:apple]).to eq 1
    end

    it "assigns value to key ':banana'" do
      hash[:banana] = 2
      expect(hash[:banana]).to eq 2
    end

    it 'assigns value to existing key overwriting previous value' do
      hash[:cherry] = 3
      hash[:cherry] = 4
      expect(hash[:cherry]).to eq 4
    end
  end

  before(:each) do
    hash[:apple] = 1
    hash[:banana] = 2
    hash[:cherry] = 3
  end

  describe '#[key]' do
    it 'returns 1' do
      expect(hash[:apple]).to eq 1
    end

    it 'returns 2' do
      expect(hash[:banana]).to eq 2
    end

    it 'returns 3' do
      expect(hash[:cherry]).to eq 3
    end
  end

  describe '#keys' do
    it 'returns keys after initial assignment' do
      expect(hash.keys).to eq([:apple, :banana, :cherry])
    end

    it 'returns keys after (key, value) pair addition' do
      hash[:grapefruit] = 4
      expect(hash.keys).to eq [:apple, :banana, :cherry, :grapefruit]
    end
  end

  describe '#values' do
    it 'returns values after initial assignment' do
      expect(hash.values).to eq [1, 2, 3]
    end

    it 'returns values after (key, value) pair addition' do
      hash[:grapefruit] = 4
      expect(hash.values).to eq [1, 2, 3, 4]
    end
  end

  describe '#size' do
    it 'returns size after initial assignment' do
      expect(hash.size).to eq 3
    end

    it 'returns size after (key, value) pair addition' do
      hash[:grapefruit] = 4
      expect(hash.size).to eq 4
    end
  end

  describe '#clear' do
    before(:each) do
      hash.clear
    end

    it 'empties keys upon clearance' do
      expect(hash.keys).to eq []
    end

    it 'empties values upon clearance' do
      expect(hash.values).to eq []
    end

    it 'returns null size after clearance' do
      expect(hash.size).to eq 0
    end
  end

  describe '#empty?' do
    it 'returns true if hash is empty' do
      hash.clear
      expect(hash.empty?).to be true
    end

    it 'returns false if hash is not empty' do
      expect(hash.empty?).to be false
    end
  end

  describe 'eql?' do
    let (:hash_to_compare) { MyHash.new }

    before do
      hash.keys.each { |key| hash_to_compare[key] = hash[key] }
    end

    it 'returns true if hashes are equal' do
      expect(hash.eql?(hash_to_compare)).to be true
    end

    it 'returns false if compared hash is of wrong type' do
      expect(hash.eql?('string')).to be false
      expect(hash.eql?(1)).to be false
      expect(hash.eql?( { apple: 1, banana: 2, cherry: 3 } )).to be false
    end

    it 'returns false if hashes have different sizes' do
      hash_to_compare[:grapefruit] = 4
      expect(hash.eql?(hash_to_compare)).to be false
    end

    it 'returns false if hashes have same keys but different values' do
      hash_to_compare[:apple] = 0
      expect(hash.eql?(hash_to_compare)).to be false
    end

    it 'returns false if hashes have same values but different keys' do
      hash_to_compare.clear
      hash_to_compare[:apple] = 1
      hash_to_compare[:banana] = 2
      hash_to_compare[:coconut] = 3
      expect(hash.eql?(hash_to_compare)).to be false
    end

    it 'returns false if hashes have same keys and values but different pairs' do
      hash_to_compare[:apple] = 2
      hash_to_compare[:banana] = 1
      expect(hash.eql?(hash_to_compare)).to be false
    end
  end
end
