require_relative "data_source"

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @ds = data_source
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

  define_component :cpu
  define_component :mouse
  define_component :keyboard
  define_component :display
end
