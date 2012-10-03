require_relative "walle"
require 'test/unit'

class TestWalle < Test::Unit::TestCase

  def test_file_path
    assert(defined?(Walle))
    assert_equal(Class, Walle.class)
  end

  def test_instantiation
    robot = Walle.new(0, 0, :north)

    assert_equal(0, robot.x)
    assert_equal(0, robot.y)
    assert_equal(:north, robot.direction)
  end

  def test_valid_range
    assert(Walle.new(0, 0, :north).valid?)
    assert(!Walle.new(-1, 0, :north).valid?)
    assert(!Walle.new(0, -1, :north).valid?)
    assert(!Walle.new(0, 0, :northwest).valid?)
  end

  def test_basic_left
    robot = Walle.new(0, 0, :north)

    robot.left

    assert_equal("0,0,WEST", robot.report)
  end

  def test_basic_right
    robot = Walle.new(0, 0, :north)

    robot.right

    assert_equal("0,0,EAST", robot.report)
  end

  def test_basic_report
    robot = Walle.new(0, 0, :north)

    assert_equal("0,0,NORTH", robot.report)
  end

  def test_basic_move_north
    robot = Walle.new(0, 0, :north)
    robot.move

    assert_equal("0,1,NORTH", robot.report)
  end

  def test_move_north_boundary
    robot = Walle.new(0, 4, :north)
    robot.move

    assert_equal("0,4,NORTH", robot.report)
  end

  def test_move_east_boundary
    robot = Walle.new(4, 0, :east)
    robot.move

    assert_equal("4,0,EAST", robot.report)
  end

  def test_move_south_boundary
    robot = Walle.new(0, 0, :south)
    robot.move

    assert_equal("0,0,SOUTH", robot.report)
  end

  def test_move_west_boundary
    robot = Walle.new(0, 0, :west)
    robot.move

    assert_equal("0,0,WEST", robot.report)
  end
end
