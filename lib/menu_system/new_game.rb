require '../user_prompts.rb'
require '../game.rb'

# Starts a new game and will either call execute method or main_menu method
def new_game
    puts "Start A New Game?".colorize(:light_magenta,)
    puts "------------------------------------------------------".colorize(:yellow)
    prompt = TTY::Prompt.new
    choices = [
        {name: 'Yes', value: 1},
        {name: 'No', value: 2},
    ]
        players_input = prompt.select("Select An Option:", choices)  
        case players_input
            when 1
               return execute_game
            when 2
                return main_menu
        end   
end


