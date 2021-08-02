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

        def set_board(board_width, board_height)
            @board = create_board_hash(board_width,board_height)
        end

        def check_bearings
            if @bearings.include? @direction
                return true
            else
                return invalid_bearings
            end
        end

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

        def place(x,y,direction)
            @positionX = x
            @positionY = y
            @direction = direction
                if check_bearings == true 
                   check_valid_tile(@positionX,@positionY,@direction) 
                end
        end

        def move_message
            puts "Attempting to Move Robot to PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
        end

        def move_n
            if @on_board == true &&  @setPosition = true
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

        def turning_robot
                puts "Turn Robot #{@direction}"
        end

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


