require 'benchmark/ips'
require 'my_hash_benchmark/hash_functions_for_benchmark'

module MyHashBenchmark
  def MyHashBenchmark.execute_assignment_benchmark(keys_and_values)
    Benchmark.ips do |x|
      x.report('MyHash') { HashFunctionsForBenchmark.assign_to_my_hash(keys_and_values) }
      x.report('RubyHash') { HashFunctionsForBenchmark.assign_to_ruby_hash(keys_and_values) }
      x.compare!
    end
  end

  def MyHashBenchmark.execute_retrieval_benchmark(keys_and_values)
    Benchmark.ips do |x|
      x.report('MyHash') { HashFunctionsForBenchmark.retrieve_from_my_hash(keys_and_values) }
      x.report('RubyHash') { HashFunctionsForBenchmark.retrieve_from_ruby_hash(keys_and_values) }
      x.compare!
    end
  end
end
