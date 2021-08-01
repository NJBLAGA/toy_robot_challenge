require './robot.rb'

def invalid_bearings
    system("clear")
    puts "The Direction command you have selected is invalid."
end

def report_robot_off_board
    puts "REPORT -- Robot is off the board"
    puts "Could not be placed within any valid deminsions of the board"
    puts "Would You Like to Reselect your commands?"
end