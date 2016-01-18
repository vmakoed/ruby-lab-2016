module HashFunctionsForBenchmark
  def HashFunctionsForBenchmark.assign_to_my_hash(args)
    hash = MyHash.new
    args.each do |key, value|
      hash[key] = value
    end
  end

  def HashFunctionsForBenchmark.assign_to_ruby_hash(args)
    hash = HashWithIndifferentAccess.new
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
    hash = HashWithIndifferentAccess.new
    args.each do |key, value|
      hash[key]
    end
  end
end