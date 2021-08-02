def construct_board
    board_dimensions  = []
    puts "Select board width".colorize(:green)
    board_width = gets.chomp
    puts "Select board height".colorize(:green)
    board_height = gets.chomp
    puts sep = "------------------------------------------------------".colorize(:yellow)
    validate_width_is_number = board_width.to_i
    validate_height_is_number = board_height.to_i
        if validate_width_is_number <= 0 && validate_height_is_number <= 0
            puts "Selection must be a number".colorize(:red)
            return construct_board
        else 
            validated_width = validate_width_is_number
            validated_height = validate_height_is_number
            board_size = validated_width.to_i * validated_height.to_i 
            puts "You have selected a board width of #{validated_width} and a board height of #{validated_height}.".colorize(:green)
            puts "Constructing a board with #{board_size} tiles.".colorize(:green)
               if validated_width == validated_height
                  board_dimensions.push(validated_width, validated_height)
                  puts sep
               else
                  puts "Sorry, the board's width and height must be equal to each other. Try again".colorize(:red)
                  puts sep
                  return construct_board
               end
        end
        return board_dimensions
end


class Commands
    def initialize(commands =[])
        @commands_sequence = commands
    end
def user_commands
    puts sep = "------------------------------------------------------".colorize(:yellow)
    prompt = TTY::Prompt.new
    commands = [
        {name: 'Place', value: 1},
        {name: 'Move', value: 2},
        {name: 'Left', value: 3},
        {name: 'Right', value: 4},
        {name: 'Report', value: 5},
        {name: 'Execute Selected Commands', value: 6},
    ]
        players_input = prompt.select("Select Your Commands:", commands)  
            case players_input
            when 1
                place_command = prompt_place
                @commands_sequence.push(place_command)
                p @commands_sequence
                puts sep
                user_commands
            when 2
                move_command = validate_move
                @commands_sequence.push(move_command)
                p  @commands_sequence
                puts sep
                user_commands
            when 3
                left_command = validate_left
                @commands_sequence.push(left_command)
                p @commands_sequence
                puts sep
                user_commands
            when 4
                right_command = validate_right
                @commands_sequence.push(right_command)
                p @commands_sequence
                puts sep
                user_commands
            when 5
                report_command = validate_report
                @commands_sequence.push(report_command)
                p @commands_sequence
                puts sep
                user_commands
            when 6
                legal_commands = valid_commands(@commands_sequence)
                    if legal_commands.length == 0
                       puts "Command sequence must begin with a Place Command".colorize(:red)
                       user_commands
                    else 
                       return legal_commands
                    end
            end   
    end
end

def prompt_place
    place_command ={}
    puts "Position X and Y Selection:".colorize(:green)
    puts "Inputs must be a positive number between 0 and your pre-selected board width and height parameters".colorize(:green)
    puts "Example -- If board width and height are 30,30, inputs must be between 0 and 30".colorize(:green)
    puts "Select position X".colorize(:green)
    user_position_x = gets.chomp
    place_command[:position_x] = user_position_x
    puts "Select position Y".colorize(:green)
    user_position_y = gets.chomp
    place_command[:position_y] = user_position_y
    puts "Select Direction between one of the following:".colorize(:green)
    puts "NORTH, SOUTH, EAST, WEST".colorize(:green)
    user_position_direction = gets.chomp.upcase
    place_command[:position_f] = user_position_direction
    return place_command
end

def validate_move
    move_command ={}
    move_command[:user_move] = true
    puts "Move command has been added".colorize(:green)
    return move_command
end

def validate_left
    left_command ={}
    left_command[:user_left] = true
    puts "Left command has been added".colorize(:green)
    return left_command
end

def validate_right
    right_command ={}
    right_command[:user_right] = true
    puts "Right command has been added".colorize(:green)
    return right_command
end

def validate_report
    report_command ={}
    report_command[:request_report] = true
    puts "Report command has been added".colorize(:green)
    return report_command
end

def valid_commands(user_commands)
    return legal_commands = user_commands.drop_while { |command| !command.dig(:position_x)}

end

def play_again
    prompt = TTY::Prompt.new
    choices = [
        {name: 'Yes', value: 1},
        {name: 'No', value: 2},
    ]
        players_input = prompt.select("Would You like to play agian?", choices)  
        case players_input
            when 1
                execute_game
            when 2
                main_menu
        end   
end



