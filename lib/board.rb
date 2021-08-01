def create_board_hash
    board = {}
    tile = 1
    positionX = 0
    positionY = 0
        while tile <= 25
            board[:"Tile #{tile}"] = {x: "#{positionX}", y: "#{positionY}"}
            tile += 1
            positionX += 1
                if positionX > 4
                   positionX = 0
                   positionY += 1
                end  
        end
        return board
end
    
def print_tile(board,tile_number)
    "#{board[:"Tile #{tile_number}"][:x]},#{board[:"Tile #{tile_number}"][:y]}"
end
    
def display_board(board)
    puts""
    puts game = "        Robot Challenge"
    puts boarder = "*-----------------------------*"
    counter = 25
        while counter > 0
        puts row = "| #{print_tile(board, counter -4)} | #{print_tile(board, counter -3)} | #{print_tile(board, counter - 2)} | #{print_tile(board, counter - 1)} | #{print_tile(board, counter)} |"
        puts boarder = "*-----------------------------*"
        counter -= 5
        end
    puts""
end