arr = ["move", "right", "left", "move", "place", "move", "left", "move", "report"]

puts "*---------------------------------*"


newarr =  arr.drop_while { |command| command != "place"}



puts newarr
