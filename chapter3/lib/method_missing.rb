require_relative "data_source"

class Computer < BasicObject
  def initialize(computer_id, data_source)
    @id = computer_id
    @ds = data_source
  end

  def method_missing(name, *args)
    super if !@ds.respond_to?("get_#{name}_info")
    info = @ds.send "get_#{name}_info", @id
    price = @ds.send "get_#{name}_price", @id
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def respond_to_missing?(name, include_private = false)
    @ds.respond_to?("get_#{name}_info") || super
  end
end
