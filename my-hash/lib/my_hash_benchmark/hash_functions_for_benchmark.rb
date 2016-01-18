$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"

require 'my_hash'

module HashFunctionsForBenchmark
  def HashFunctionsForBenchmark.assign_to_my_hash(args)
    hash = MyHash.new
    args.each do |key, value|
      hash[key] = value
    end
  end

  def HashFunctionsForBenchmark.assign_to_ruby_hash(args)
    hash = Hash.new
    args.each do |key, value|
      hash[key] = value
    end
  end

  def HashFunctionsForBenchmark.retrieve_from_my_hash(args)
    hash = MyHash.new
    args.each do |key, value|
      hash[key]
    end
  end

  def HashFunctionsForBenchmark.retrieve_from_ruby_hash(args)
    hash = Hash.new
    args.each do |key, value|
      hash[key]
    end
  end
end
