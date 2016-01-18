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
    keys = []
    @entries.each { |entry| keys << entry.key }
    "[#{keys.join(', ')}]"
  end

  def values
    values = []
    @entries.each { |entry| values << entry.value }
    "[#{values.join(', ')}]"
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
    @entries.each do |entry|
      if self[entry.key] != hash_to_compare[entry.key]
        return false
      end
    end
    true
  end
end
