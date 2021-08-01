require '../robot.rb'
require 'tty-prompt'
   
class Game
        def initialize(inputs = {})
            @command_X = inputs[:command_X]
            @command_Y = inputs[:command_Y]
            @command_F = inputs[:command_F]
            @command_Move = inputs[:command_Move]
            @command_Left = inputs[:command_Left]
            @command_Right = inputs[:command_Right]
            @create_robot = Robot.new  
        end

        def set_board(board_width,board_height)
            @create_robot.set_baord(board_width, board_height) 
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

        def set_place_Command
            @create_robot.place(@command_X, @command_Y, @command_F)
        end

        def get_command_first_Move(move_robot)
            @command_Move = move_robot
            if @command_Move == true
                 @create_robot.move_first(@command_X, @command_Y, @command_F)
            end
        end

        def get_command_move_N(move_robot)
            @command_Move = move_robot
            if @command_Move == true
                 @create_robot.move_n
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

def execute_game
    board_dimensions = construct_board
     new_game = Game.new
    new_game.set_board(board_dimensions[0],board_dimensions[1])
    user_prompts
    new_game.get_command_X(0)
    new_game.get_command_Y(0)
    new_game.get_command_F("EAST")
    new_game.set_place_Command
    new_game.get_command_first_Move(true)
    new_game.get_command_move_N(true)
    new_game.get_command_Left(true)
    new_game.get_command_move_N(true)
    new_game.get_command_move_N(true)
    new_game.display_report
end







