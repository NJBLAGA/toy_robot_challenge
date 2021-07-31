require './robot.rb'

class Game
    attr_reader :board, :robot

        def initialize(inputs = {})
            @command_X = inputs[:command_X]
            @command_Y = inputs[:command_Y]
            @command_F = inputs[:command_F]
            @command_Move = inputs[:command_Move]
            @command_Left = inputs[:command_Left]
            @command_Right = inputs[:command_Right]
            @create_robot = Robot.new
            
        end

        def get_command_X(position_x)
            @command_X = position_x 
        end

        def get_command_Y(position_y)
            @command_Y = position_y
        end

        def get_command_F(position_f)
            @command_F = position_f
        end

        def set_place_command
            @create_robot.place(@command_X, @command_Y, @command_F)
        end

        def get_command_Move(move_robot)
            @command_Move = move_robot
            if @command_Move == true
                 @create_robot.move
            end
        end

        def get_command_Left(turn_left)
            @command_Left = turn_left
            if @command_Left == true
                 @create_robot.left
            end
        end

        def get_command_Right(turn_right)
            @command_Right = turn_right
            if @command_Right == true
                @create_robot.right
           end
        end

        def display_report
            @create_robot.report
        end
end

game1 = Game.new
game1.get_command_X(0)
game1.get_command_Y(0)
game1.get_command_F("NORTH")
game1.set_place_command
game1.get_command_Move(true)
game1.get_command_Move(true)
game1.get_command_Right(true)
game1.get_command_Move(true)
game1.display_report




