require '../robot.rb'
require '../user_prompts.rb'

# When called informs the player, the direction they have entered is an invalid direction
# Prompts them to either play agian or redirects them to the main menu.
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
                execute_game
            when 2
                main_menu
        end   
end

# When called will inform the player that the initial place command was a illegal move, an the Robot was not place on the board.
# Prompts them to either play agian or redirects them to the main menu.
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
                execute_game
            when 2
                main_menu
        end   
end
