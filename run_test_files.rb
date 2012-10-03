require_relative 'walle'
Dir.glob('./tests/*.dat') do |data_file|
  robot = Walle.new(-1, -1, :invalid)
  file = File.open(data_file, 'r')
  file.each_line do |line|
    args = line.split(%r{\s|,})
    case args[0]
    when "PLACE" 
      if args.length == 4
        temp_robot = Walle.new(Integer(args[1], 10),
                               Integer(args[2], 10),
                               args[3].downcase.to_sym)

        robot = temp_robot if temp_robot.valid?
      end
    when "MOVE"
      robot.move if robot.valid?
    when "LEFT"
      robot.left if robot.valid?
    when "RIGHT"
      robot.right if robot.valid?
    when "REPORT"
      if robot.valid?
        puts "Output for #{data_file}"
        puts robot.report 
      end
      break
    end
  end
end
