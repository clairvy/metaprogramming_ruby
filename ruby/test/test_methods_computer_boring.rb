require 'test/unit'
require 'methods/computer/boring'
require 'methods/computer/data_source'

class StringExtensionsTest < Test::Unit::TestCase
  def test_computer
    c = Computer.new(42, DS.new)
    assert_equal c.mouse, "Mouse: Dual Optical (40)"
    assert_equal c.cpu, "* Cpu: 2.16 GHz (150)"
    assert_equal c.keyboard, "Keyboard: no-brand (20)"
  end
end
