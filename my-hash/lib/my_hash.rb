require 'my_hash/hash_entry'

class MyHash
  def initialize
    @entries = []
  end

  def [](key)
    ( @entries.detect { |entry| entry.key == key } ).value
  end

  def []=(key, value)
    found_entry = @entries.detect() { |entry| entry.key == key }
    found_entry == nil ? @entries.push(HashEntry.new(key, value)) : found_entry.value = value
  end
end
