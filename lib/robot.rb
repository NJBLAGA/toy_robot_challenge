require './board.rb'
require './invalid_inputs.rb'

class Robot

        def initialize(setting_robot={})
            @positionX = setting_robot[:positionX]
            @positionY = setting_robot[:positionY]
            @direction = setting_robot[:direction]
            @bearings = setting_robot[:direction] = ["NORTH", "SOUTH", "EAST", "WEST"]
            @board = create_board_hash(10,10)
            @setPosition = false
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
                    @setPosition = true
                    puts "Set Robot at valid PositionX: #{x}, PositionY: #{y}, Facing: #{direction}"
                    break
                else
                    @setPosition = false
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

        def move_first(x,y,direction)
            @positionX = x
            @positionY = y
            if @setPosition == true
            case @direction
                when "NORTH"
                    @positionY +=1
                    move_message
                    place(@positionX,@positionY,@direction)
                when "SOUTH"
                    @positionY -=1
                    move_message
                    place(@positionX,@positionY,@direction)
                when "EAST"
                    @positionX +=1
                    move_message
                    place(@positionX,@positionY,@direction)
                when "WEST"
                    @positionX -=1
                    move_message
                    place(@positionX, @positionY,@direction)            
                end
            end
        end

        def move_n
            if @setPosition == true
            case @direction
                when "NORTH"
                    @positionY +=1
                    move_message
                    return place(@positionX,@positionY,@direction)
                when "SOUTH"
                    @positionY -=1
                    move_message
                    return place(@positionX,@positionY,@direction)
                when "EAST"
                    @positionX +=1
                    move_message
                    return place(@positionX,@positionY,@direction)
                when "WEST"
                    @positionX -=1
                    move_message
                    return place(@positionX, @positionY,@direction)             
                end
            end
        end

        def left
            if check_bearings == true && @setPosition == true
                case @direction
                    when "NORTH"
                        @direction = "WEST"
                    when "SOUTH"
                        @direction = "EAST"
                    when "EAST"
                        @direction = "NORTH"
                    when "WEST"
                        @direction = "SOUTH"
                end
                puts "Robot is now Facing #{@direction}"
            end
        end

        def right
            if check_bearings == true && @setPosition == true
                case @direction
                    when "NORTH"
                        @direction = "EAST"
                    when "SOUTH"
                        @direction = "WEST"
                    when "EAST"
                        @direction = "SOUTH"
                    when "WEST"
                        @direction = "NORTH"
                end
                puts "Robot is now Facing #{@direction}"
            end
        end

        def report
            if  @setPosition == false
                return report_robot_off_board
            else
                puts "REPORT -- PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
            end
        end
end

