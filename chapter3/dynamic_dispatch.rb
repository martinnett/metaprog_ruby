require_relative "data_source"

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @ds = data_source
  end

  def cpu
    component :cpu
  end

  def mouse
    component :mouse
  end

  def keyboard
    component :keyboard
  end

  def display
    component :display
  end

  private

  def component(name)
    info = @ds.send "get_#{name}_info", @id
    price = @ds.send "get_#{name}_price", @id
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end