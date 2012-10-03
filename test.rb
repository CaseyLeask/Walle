require_relative "walle"
require 'test/unit'

class TestWalle < Test::Unit::TestCase

  def test_file_path
    assert(true, defined?(Walle))
    assert_equal(Class, Walle.class)
  end

  def test_instantiation
    robot = Walle.new(0, 0, :north)

    assert_equal(0, robot.x)
    assert_equal(0, robot.y)
    assert_equal(:north, robot.direction)
  end

end
