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
            @command_Report = inputs[:command_Report]
            @create_robot = Robot.new  
        end

        def set_board(board_width,board_height)
            @create_robot.set_board(board_width, board_height) 
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

        def display_report(report)
            @command_Report = report
            if @command_Report == true
                @create_robot.report
           end
        end
end

def execute_game
    board_dimensions = construct_board
    board_width = board_dimensions[0]
    board_height = board_dimensions[1]
    new_game = Game.new
    p new_game.set_board(board_width,board_height)
    new_commands = Commands.new
    active_commands = new_commands.user_commands

    active_commands.each do |command|  
        if command.include?(:position_x) && command.include?(:position_y) && command.include?(:position_f)
            @command_X = command[:position_x].to_i
            @command_Y = command[:position_y].to_i
            @command_F = command[:position_f]
            new_game.get_command_X(@command_X)
            new_game.get_command_Y(@command_Y)
            new_game.get_command_F(@command_F)
            new_game.set_place_Command()
        end
        if command.include?(:user_move) 
            @command_move = command[:user_move]
            new_game.get_command_move_N(@command_move)
        end
        if command.include?(:user_left) 
             @command_left = command[:user_left]
             new_game.get_command_Left(@command_left)
        end
        if command.include?(:user_right) 
            @command_right = command[:user_right]
            new_game.get_command_Right(@command_right)
        end
        if command.include?(:request_report) 
            @command_report = command[:request_report]
            new_game.display_report(@command_report)
        end    
    end
    active_commands = []
    play_again
end








