require './robot.rb'

def out_of_bounds_err
    # system("clear")
    err_message
end


def err_message
    puts "Failed to set Robot to PositionX: #{@positionX }, PositionY: #{@positionY}, Facing: #{@direction}"
    puts ""
    puts "Robot can not be placed at requested position."
    puts "Would you like to try?"

end