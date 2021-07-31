# ToyRobotChallenge

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/toy_robot_challenge`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

## Development

```plain
#Robot
# Ask user for position X, position Y and Facing


# PLACE X,Y,F
#  => iterate through hash
# => if board[:x] == placeX && if board[:y] == placeY
# => PLACE robot @ board[:x][:y] with FACING @ [NORTH,SOUTH,WEST,EAST]
# else => puts "Can not execute PLACE command, It is not on the board"

# MOVE
# => LOOK AT CURRENT FACING,
# SWITCH STATEMENT
# if NORTH -> placeY +=1
# if SOUTH -> placeY -=1
# if EAST -> placeX += 1
# if WEST -> placeX -= 1

# => iterate through hash
# if => NEW CURRENT TILE is within hash
# MOVE ROBOT TO NEW POSITION
# else => INVALID MOVE COMMAND

# LEFT -> SWITCH STATEMENT
# if NORTH -> WEST
# if SOUTH -> EAST
# if EAST -> NORTH
# if WEST -> SOUTH

# RIGHT -> SWITCH STATEMENT
# if NORTH -> EAST
# if SOUTH -> WEST
# if EAST -> SOUTH
# if WEST -> NORTH

# REPORT
# => print CURRENT POSITION IF VALID
```

```plain
{:Tile1=>{:x=>"0", :y=>"0"}, :Tile2=>{:x=>"1", :y=>"0"}, :Tile3=>{:x=>"2", :y=>"0"}, :Tile4=>{:x=>"3", :y=>"0"}, :Tile5=>{:x=>"4", :y=>"0"}, :Tile6=>{:x=>"0", :y=>"1"}, :Tile7=>{:x=>"1", :y=>"1"}, :Tile8=>{:x=>"2", :y=>"1"}, :Tile9=>{:x=>"3", :y=>"1"}, :Tile10=>{:x=>"4", :y=>"1"}, :Tile11=>{:x=>"0", :y=>"2"}, :Tile12=>{:x=>"1", :y=>"2"}, :Tile13=>{:x=>"2", :y=>"2"}, :Tile14=>{:x=>"3", :y=>"2"}, :Tile15=>{:x=>"4", :y=>"2"}, :Tile16=>{:x=>"0", :y=>"3"}, :Tile17=>{:x=>"1", :y=>"3"}, :Tile18=>{:x=>"2", :y=>"3"}, :Tile19=>{:x=>"3", :y=>"3"}, :Tile20=>{:x=>"4", :y=>"3"}, :Tile21=>{:x=>"0", :y=>"4"}, :Tile22=>{:x=>"1", :y=>"4"}, :Tile23=>{:x=>"2", :y=>"4"}, :Tile24=>{:x=>"3", :y=>"4"}, :Tile25=>{:x=>"4", :y=>"4"}}

```
