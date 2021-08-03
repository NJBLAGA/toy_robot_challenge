require '../board.rb'
require '../invalid_inputs.rb'

class Robot
        def initialize(setting_robot={})
            @positionX = setting_robot[:positionX]
            @positionY = setting_robot[:positionY]
            @direction = setting_robot[:direction]
            @bearings = setting_robot[:direction] = ["NORTH", "SOUTH", "EAST", "WEST"]
            @on_board = false
            @setPosition = false
            @skip_command = false
        end
        # When called, calls the create_board_has to create the board(hash).
        def set_board(board_width, board_height)
            @board = create_board_hash(board_width,board_height)
        end
        # Checks if the direction the player has entered is valid
        def check_bearings
            if @bearings.include? @direction
                return true
            else
                return invalid_bearings
            end
        end
        # Checks if the x position and y position entered by the player exists within the board(hash.)
        def check_valid_tile(x,y,direction)
            @board.each do |key, value|
                if value[:x] == @positionX && value[:y]  == @positionY
                    @positionX = value[:x]
                    @positionY = value[:y]
                    @on_board = true
                    @setPosition = true
                    @skip_command = false
                    puts "Robot set at valid PositionX: #{x}, PositionY: #{y}, Facing: #{direction}"
                    break
                else
                    @skip_command = true
                end
            end
        end
        # When called, takes x position, y position and direction, and runs them through check_bearings and check_valid_tile methods before setting Robot on board.
        def place(x,y,direction)
            @positionX = x
            @positionY = y
            @direction = direction
                if check_bearings == true 
                   check_valid_tile(@positionX,@positionY,@direction) 
                end
        end
        # Displays to the player, an attempt is being made to move Robot.
        def move_message
            puts "Attempting to Move Robot to PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
        end
        # If Robot is on board and has a set position, run a case statement.
        # Depending on initial direction facing, the Robot will move either by the x position or y position.
        def move_n
            if @on_board == true &&  @setPosition == true
                case @direction
                    when "NORTH"
                        @positionY +=1
                        move_message
                        place(@positionX,@positionY,@direction)
                        if @skip_command == true
                            puts "That Move would result in the Robot falling -- Skipping Command"
                            @positionY -=1
                            @skip_command = false
                            return place(@positionX,@positionY,@direction)
                        end
                         
                    when "SOUTH"
                        @positionY -=1
                        move_message
                        place(@positionX,@positionY,@direction)
                        if @skip_command == true
                            puts "That Move would result in the Robot falling -- Skipping Command"
                            @positionY +=1
                            return place(@positionX,@positionY,@direction)                         
                        end
                         
                    when "EAST"
                        @positionX +=1
                        move_message
                        place(@positionX,@positionY,@direction)
                        if @skip_command == true
                            puts "That Move would result in the Robot falling -- Skipping Command"
                            @positionX -=1
                            return place(@positionX,@positionY,@direction)                          
                        end
                         
                    when "WEST"
                        @positionX -=1
                        move_message
                        place(@positionX,@positionY,@direction)
                        if @skip_command == true
                            puts "That Move would result in the Robot falling -- Skipping Command"
                            @positionX +=1
                        return place(@positionX,@positionY,@direction)
                        end
                    end      
            end
        end
        # Dispays to the player that the Robot is being turn to specified direction.
        def turning_robot
                puts "Turn Robot #{@direction}"
        end
        # Checks if check_bearings and set_position are valid.
        # If the player has selected to move left.
        # Runs a case statement and changes the directions based of the Robot's previous direction.
        def left
            if check_bearings == true && @setPosition == true
                case @direction
                    when "NORTH"
                        @direction = "WEST"
                        turning_robot
                    when "SOUTH"
                        @direction = "EAST"
                        turning_robot
                    when "EAST"
                        @direction = "NORTH"
                        turning_robot
                    when "WEST"
                        @direction = "SOUTH"
                        turning_robot
                end
                puts "Robot is now Facing #{@direction}"
            end
        end
        # Checks if check_bearings and set_position are valid.
        # If the player has selected to move right.
        # Runs a case statement and changes the directions based of the Robot's previous direction.
        def right
            if check_bearings == true && @setPosition == true
                case @direction
                    when "NORTH"
                        @direction = "EAST"
                        turning_robot
                    when "SOUTH"
                        @direction = "WEST"
                        turning_robot
                    when "EAST"
                        @direction = "SOUTH"
                        turning_robot
                    when "WEST"
                        @direction = "NORTH"
                        turning_robot
                end
                puts "Robot is now Facing #{@direction}"
            end
        end
        # If player has requested a report, report will be called.
        # Displays to the user the current position x,y of the Robot and the direction it is facing.
        def report
            if @on_board  == false
                report_invalid_move
            else
                puts "------------------------------------------------------".colorize(:yellow)
                puts "REPORT -- PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
                puts "------------------------------------------------------".colorize(:yellow)
            end
        end
end


