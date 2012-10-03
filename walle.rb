class Walle
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move
  end

  def left
    case @direction
    when :north
      @direction = :west
    when :east
      @direction = :north
    when :south
      @direction = :east
    when :west
      @direction = :south
    end
  end

  def right
    case @direction
    when :north
      @direction = :east
    when :east
      @direction = :south
    when :south
      @direction = :west
    when :west
      @direction = :north
    end
  end

  def report
    "X: #{@x}, Y: #{@y}, F: #{@direction}"
  end

end
