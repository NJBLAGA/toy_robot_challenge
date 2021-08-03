require 'colorize'
require 'artii'
require 'tty-prompt'
require './new_game.rb'
require './exit.rb'

# Starts Game -- gives player access to menu system
def main_menu
    puts "------------------------------------------------------------------------------------------------------".colorize(:yellow)
    Artii::Base#asciify
    a = Artii::Base.new
    a.asciify("Toy Robot Challenge")
    system("clear")
    puts a.asciify("Toy Robot Challenge").colorize(:red,)

    prompt = TTY::Prompt.new
    choices = [
        {name: 'New Game.', value: 1},
        {name: 'Exit.', value: 2},
    ]
        players_input = prompt.select("Select An Option:", choices)  
        case players_input
            when 1
                new_game
            when 2
                exit
        end   
end

main_menu