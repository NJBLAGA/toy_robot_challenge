require './board.rb'

class Robot

        def initialize(setting_robot={})
            @positionX = setting_robot[:positionX]
            @positionY = setting_robot[:positionY]
            @direction = setting_robot[:direction]
            @bearings = setting_robot[:direction] = ["NORTH", "SOUTH", "EAST", "WEST"]
            @tile = setting_robot[:tile]
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
                       @tile = key
                    else
                       #  puts "POSITION NOT FOUND -- TRY AGAIN"
                    end
                end
                # puts "Set Robot Position at #{@tile} - PositionX: #{x}, PositionY: #{y}, Facing: #{direction}"
                # puts display_board(create_board_hash)
        end

        def move
            case @direction
                when "NORTH"
                    @positionY +=1
                when "SOUTH"
                    @positionY -=1
                when "EAST"
                    @positionX +=1
                when "WEST"
                    @positionX -=1
                else
                    puts "INVALID MOVE"
                end
                # puts "Robot Will MOVE at PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
                # place(@positionX,@positionY,@direction)
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
                # puts " Robot is now FACING #{@direction}"
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
            # puts " Robot is now FACING #{@direction}"
        end

        def report
            puts display_board(create_board_hash)
            puts "PositionX: #{@positionX}, PositionY: #{@positionY}, Facing: #{@direction}"
        end
end

