require 'my_hash/hash_entry'

class MyHash
  def initialize
    @entries = []
  end

  def [](key)
    ( @entries.reverse.detect { |entry| entry.key == key } ).value
  end

  def []=(key, value)
    @entries << HashEntry.new(key, value)
  end

end