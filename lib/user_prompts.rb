def construct_board
    board_dimensions  = []
    puts "Select board width"
    board_width = gets.chomp
    puts "Select board height"
    board_height = gets.chomp

    validate_width_is_number = board_width.to_i
    validate_height_is_number = board_height.to_i
        if validate_width_is_number <= 0 && validate_height_is_number <= 0
            puts "Please select numbers only"
            construct_board
        else 
            validated_width = validate_width_is_number
            validated_height = validate_height_is_number
            board_size = validated_width.to_i * validated_height.to_i 
            puts "You have selected a board width of #{validated_width} and a board height of #{validated_height}."
               if validated_width == validated_height
                  board_dimensions.push(validated_width, validated_height)
               else
                  puts "Sorry, the board's width and height must be equal to each other. Try agian"
                  puts "------------------------------------------------------".colorize(:yellow)
                  return construct_board
               end
     
        puts "This will construct a board of #{board_size} tiles."
        prompt = TTY::Prompt.new
            choices = [
                {name: 'Yes', value: 1},
                {name: 'No', value: 2},
            ]
            players_input = prompt.select("Are you happy to continue?", choices)  
                case players_input
                    when 1
                        return board_dimensions
                    when 2
                        return construct_board
                end   
        end
end

def user_commands
    commands_sequence = []
      prompt = TTY::Prompt.new
    commands = [
        {name: 'Place', value: 1},
        {name: 'Move', value: 2},
        {name: 'Left', value: 3},
        {name: 'Right', value: 4},
        {name: 'Execute Selected Commands', value: 5},

    ]
        players_input = prompt.select("Select Your Commands:", commands)  
        case players_input
            when 1
                validate_place
            when 2
                validate_move
            when 3
                validate_left
            when 4
                validate_right
        end   
end

def user_prompts
    puts "------------------------------------------------------".colorize(:yellow)

end

def prompt_place
    puts "Select position X"
    puts "Select position Y"
    puts "Select Direction"
end

def validate_move
    puts "Select Move Command"
end

def validate_left
    puts "Select Left Command"
end

def validate_right
    puts "Select Right Command"
end




# arr = ["move", "right", "left", "move", "place", "move", "left", "move", "report"]
# puts "*---------------------------------*"
# newarr =  arr.drop_while { |command| command != "place"}
# puts newarr

