class Walle
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def valid?
    @x.between?(0,4) && 
    @x.is_a?(Integer) &&
    @y.between?(0,4) && 
    @y.is_a?(Integer) &&
    [:north, :south, :east, :west].member?(@direction)
  end

  def move
    instance_eval "move_#{@direction}"
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

private
  def move_north
    if @y < 4
      @y += 1
    end
  end

  def move_east
    if @x < 4
      @x += 1
    end
  end

  def move_south
    if @y > 0
      @y -= 1
    end
  end

  def move_west
    if @x > 0
      @x -= 1
    end
  end

end
