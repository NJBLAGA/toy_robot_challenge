# ToyRobotChallenge

## Nathan Blaga Toy Robot Challenge Repo [https://github.com/NJBLAGA/toy_robot_challenge]

## Instructions

Follow the below steps to successfully install and run `toy_robot_challenge`

1. Head over to the project's GitHub page at `https://github.com/NJBLAGA/toy_robot_challenge`
1. Click on the green button labelled `code`
1. Copy either the HTTPS or SSH link.
1. In your terminal, head to the directory/folder of your choice (where you want to store your project)
1. Type the following command `git clone xxxxxxxxxxxxx` (xxxx denoting the copied link from step 3)
1. This command will then proceed to clone the `toy_robot_challenge` repo to your local machine
1. Navigate to your local cloned copy of `toy_robot_challenge` by using `cd toy_robot_challenge` in your terminal
1. Using `bundle install` , install the projects required dependencies and gems.'
1. Once the above command has finished, open the project using the command `code .` (if using VS Code) or the text editor of your choice
1. Open up a terminal within your selected text editor
1. Navigate to the `lib` folder by using `cd lib` in your terminal
1. Now navigate to the `menu_system` folder by using `cd menu_system` in your terminal
1. Once you are within the `menu_system` folder, in your terminal, run the command `ruby main_menu.rb`
1. The `main_menu.rb` file should then be executed and start the game up
1. Navigate through the menu system, press `New Game` and enjoy

## Tech Stack

- Ruby v2.7.2

## Dependencies

- gem "rspec", "~> 3.0"
- gem "artii", "~> 2.1"
- gem "colorize", "~> 0.8.1"
- gem "tty-prompt", "~> 0.22.0"

## About

This project was developed in an attempt to provide a possible solution to the Toy Robot Challenge. Utilising `Ruby` and various `gems` the solution was formulated and executed with the following notions in mind:

- The player can provide a list of commands
- Commands are read and validated by the game then executed
- The game safeguards user-inputs by utilising error-handing and validations
- The code base would aim in following a `clean code` approach, i.e - testable, maintainable, scalable etc
- Easy navigation and user experience

## Why Ruby

Initially the choice was to develop this solution either with `Ruby` or `JavaScript` (within a `node` environment). `Ruby` was eventually selected for a number of reasons.

- The initial design and conception of the solution called for a `Object oriented approach (OOP)`
- `Ruby` offered `helper methods` that aided in the construction of the code base, for example the `array` method `.drop_while` and `.dig` method ( both located in the `user_prompts.rb` file
- The `.drop_while` method allowed the solution to take the `user_commands` `array` and drop any command that was requested before a initial `place` command was present within the `array`
- This satisfied the requirement that the solution would ignore any command that was request before a `place` command
- The `.dig` method allowed the code base to search a given `hash` (and `hashes` within said `hash`) and draw out `values` (in this case -- user inputs for selected commands)
- `Ruby` has a number of code-friendly and user-friendly `gems` such as `tty-prompt`, which enhances the player-experience.

## Development

Initial development saw different variations of how the code base was to be structured and formulated. Below are notes that were established as the basic building block for the solution.

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
# if NORTH -> EAST an
# if SOUTH -> WEST
# if EAST -> SOUTH
# if WEST -> NORTH

# REPORT
# => print CURRENT POSITION IF VALID
```

## User Stories & Proposed Solutions

- As a user I want to have easy navigation and prompting.

**Solution:**

As mentioned above by utilising `tty-prompt`, the solution allows for a smooth player experience. From the main menu to command selection, the player is guided through board creation and command selection.

- As a user I want to input selected commands.

**Solution:**

The solution does a solid job of prompting the user to select board dimensions and command inputs. Through several methods that handle the inputs validations. The player has access to several commands:

- Place
- Move
- Left
- Right
- Report
- Execute Selected Commands

- As a user I want the application to handle any false inputs or input errors with grace.

**Solution:**

The game does a good job of prompting the player on inputs that would be classified as invalid and instructs them to select new ones.

- As a user I want to have updates on the Robot's movements, positioning and direction, and failed attempts.

**Solution:**

Due to the solution not providing a visual que and indication of the board and Robot's state, it was critical to display to the player the results of each command. Although the `Report` command was initially intended to display a `after action report`, I thought it would be more insightful if the player could gain a better understanding of how the game operated. This in turn added value to the player experience.

- As a user I want to customise the dimensions of the board.

**Solution:**

The `create_board_hash(width, height)` method located in the `board.rb` file, allows the user to construct a board(`hash`) based on the dimensions of their liking. This allows for a more rich player experience and for a more scalable code base.

## Testing

Testing was undertaken with the aid of the `Ruby gem` `rspec`. The only tests that are within the codebase is testing the `create_board_hash` method (located in the `board_spec.rb` within the `spec` folder). While a manually testing approach was taken throughout the development of the solutions, more automated tests are needed to better formulate a more proficient solution. SEE `Self-Reflection` section.

## Assumptions made

Several assumptions were made in regards to the design and development of the solution:

- The board and Robot did not have to be displayed to the player
- This was overcome by displaying to the player how each command was resolved
- The player could not select negative numbers for position `x` and `y`
- The directions selected by the player could be either one of the four following: NORTH, SOUTH, EAST, WEST
- Validations were set in place to ensure players could input direction without needing to worry about capital letters
- The board was a square and not any other form of quadrilateral shape (rectangle)
- This meant that a validation had to be used to ensure that the players `width` and `height` inputs must equal each other
- Once a player has selected their commands (currently unlimited), whether the commands executed successfully or not, the player was prompted to start a new board and select new commands

## Self-Reflection

(Although not found within professional documentations, some insight into my thought process)

- The challenge allowed me to express myself in a very creative and logical manner.
- Although I did not undertake a `Test Driven Development Approach` towards this project and provided insufficient testing, it did allow me to achieve a better understanding on the importance of automated testing practices, `pen`, `unit` etc.
- In turn it has driven me to not only focus on improving my knowledge base and understanding on `unit` testing, but inspired me to undergo further development into providing and executing a stronger approach.
- I believe further progression down this path will result in a more efficient and effective codebase/solution.
- Looking back at the code I have written, if tasked to create a new solution or even a refactor, I would do the following:
- Utilise classes more efficiently and effectively through `modules` and `mixins`
- Refine the flow of inputs/data between the player and the Robot class
- Better proficiency with a `OOP` would allow for easier `unit` and `pen` testing, less occurrence of edge case errors and behaviour.
