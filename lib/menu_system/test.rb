arr = [{:user_move=>true}, {:position_x=>"5", :position_y=>"5", "position_f"=>"5"}, {:user_move=>true}]


legal_commands = arr.drop_while { |command| command.dig(:position_x)}

p legal_commands

