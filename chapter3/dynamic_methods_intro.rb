require_relative "data_source"

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @ds = data_source
    @ds.public_methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method(name) do
      info = @ds.send "get_#{name}_info", @id
      price = @ds.send "get_#{name}_price", @id
      result = "#{name.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
  end
end
