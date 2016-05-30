require_relative "lib/method_missing"

module Chapter3
  ds = DataSource.new
  comp = Computer.new(1, ds)
  puts comp.display
end