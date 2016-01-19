require 'my_hash/hash_entry'

class MyHash
  def initialize
    @entries = []
  end

  def [](key)
    found_entry = @entries.detect { |entry| entry.key == key }
    found_entry == nil ? nil : found_entry.value
  end

  def []=(key, value)
    found_entry = @entries.detect() { |entry| entry.key == key }
    found_entry == nil ? @entries << HashEntry.new(key, value) : found_entry.value = value
  end

  def keys
    @entries.collect { |entry| entry.key }
  end

  def values
    @entries.collect { |entry| entry.value }
  end

  def size
    @entries.size
  end

  def empty?
    @entries.empty?
  end

  def clear
    @entries = []
  end

  def eql?(hash_to_compare)
    eql_type?(hash_to_compare) && eql_size?(hash_to_compare) && eql_entries?(hash_to_compare)
  end

  private

  def eql_type?(hash_to_compare)
    hash_to_compare.is_a? MyHash
  end

  def eql_size?(hash_to_compare)
    self.size != hash_to_compare.size ? false : true
  end

  def eql_entries?(hash_to_compare)
    eql_keys?(hash_to_compare) && eql_values?(hash_to_compare) && eql_pairs?(hash_to_compare)
  end

  def eql_keys?(hash_to_compare)
    self.keys.sort.eql?(hash_to_compare.keys.sort)
  end

  def eql_values?(hash_to_compare)
    self.values.sort.eql?(hash_to_compare.values.sort)
  end

  def eql_pairs?(hash_to_compare)
    @entries.each do |entry|
      if self[entry.key] != hash_to_compare[entry.key]
        return false
      end
    end
    true
  end
end
