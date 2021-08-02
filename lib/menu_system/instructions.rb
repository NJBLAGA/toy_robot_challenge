def instructions
    puts "Instructions:".colorize(:light_magenta,)
    puts "1".colorize(:yellow,)
    puts "2".colorize(:yellow,)
    puts "3".colorize(:yellow,)
    puts "4".colorize(:yellow,)
    puts "5".colorize(:yellow,)

    prompt = TTY::Prompt.new
    choices = [
        {name: 'Main Menu.', value: 1},
    ]
        players_input = prompt.select("Return To Main Menu.", choices)    
            case players_input
                 when 1
                    system("clear")
                    return main_menu
    # When 1 is true, screen is cleared and returns player to the main menu screen.
                 end 
end
