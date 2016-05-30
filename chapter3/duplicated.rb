require_relative "data_source"

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @ds = data_source
  end

  def cpu
    info = @ds.get_cpu_info(@id)
    price = @ds.get_cpu_price(@id)
    result = "Cpu: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def mouse
    info = @ds.get_mouse_info(@id)
    price = @ds.get_mouse_price(@id)
    result = "Mouse: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def keyboard
    info = @ds.get_keyboard_info(@id)
    price = @ds.get_keyboard_price(@id)
    result = "Keyboard: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def display
    info = @ds.get_display_info(@id)
    price = @ds.get_display_price(@id)
    result = "Display: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end