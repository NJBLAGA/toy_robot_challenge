require '../robot.rb'
require '../user_prompts.rb'

def invalid_bearings
    puts "The Direction command you have selected is invalid."
    prompt = TTY::Prompt.new
    choices = [
        {name: 'Yes', value: 1},
        {name: 'No', value: 2},
    ]
        players_input = prompt.select("Would You Like to Reselect your commands?", choices)  
        case players_input
            when 1
                # exe_command = Commands.new
                # exe_command.user_commands
                execute_game
            when 2
                main_menu
        end   
end

def report_invalid_move
    puts "INVALID MOVE -- Robot will not be placed on the board."
    prompt = TTY::Prompt.new
    choices = [
        {name: 'Yes', value: 1},
        {name: 'No', value: 2},
    ]
        players_input = prompt.select("Would You Like to Reselect your commands?", choices)  
        case players_input
            when 1
                # exe_command = Commands.new
                # exe_command.user_commands
                execute_game
            when 2
                main_menu
        end   
end

