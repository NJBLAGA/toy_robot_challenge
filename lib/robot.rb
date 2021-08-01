require './board.rb'
require './invalid_inputs.rb'

class Robot

        def initialize(setting_robot={})
            @positionX = setting_robot[:positionX]
            @positionY = setting_robot[:positionY]
            @direction = setting_robot[:direction]
            @bearings = setting_robot[:direction] = ["NORTH", "SOUTH", "EAST", "WEST"]
        end

        def place(x,y,direction)
            @positionX = x
            @positionY = y
            @direction = direction
                if @bearings.include? @direction
                   @direction
                else
                   puts "Invalid direction -- TRY AGAIN"
                end
                create_board_hash.each do |key, value|
                    if value[:x] == @positionX.to_s && value[:y]  == @positionY.to_s
                        @positionX = value[:x].to_i
                        @positionY = value[:y].to_i
                       return puts "Set Robot at valid PositionX: #{x}, PositionY: #{y}, Facing: #{direction}"
                    else
                    #    return out_of_bounds_err
                    end
                end
                # puts display_board(create_board_hash)
        end

        def move_message
            puts "Attempting to Move Robot to PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
        end

        def move_first(x,y,direction)
            @positionX = x
            @positionY = y
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
                # else
                #     puts "INVALID MOVE"
             
                end
                # puts "Robot will MOVE to PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
                # place( @positionX, @positionY,direction)
        end

        def move_n
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
                # puts "Robot will MOVE to PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
                # place( @positionX, @positionY,direction)
        end

        def left
            case @direction
                when "NORTH"
                    @direction = "WEST"
                when "SOUTH"
                    @direction = "EAST"
                when "EAST"
                    @direction = "NORTH"
                when "WEST"
                    @direction = "SOUTH"
                else
             end
                puts "Robot is now Facing #{@direction}"
        end

        def right
            case @direction
                when "NORTH"
                    @direction = "EAST"
                when "SOUTH"
                    @direction = "WEST"
                when "EAST"
                    @direction = "SOUTH"
                when "WEST"
                    @direction = "NORTH"
                else
            end
            puts "Robot is now Facing #{@direction}"
        end

        def report
            puts "REPORT -- PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
        end
end

