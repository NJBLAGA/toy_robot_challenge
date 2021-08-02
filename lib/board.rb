def create_board_hash(width, height)
    board_size = width * height
    board = {}
    tile = 1
    positionX = 0
    positionY = 0
        while tile <= board_size
            board[:"Tile #{tile}"] = {x: positionX, y: positionY}
            tile += 1
            positionX += 1
                if positionX > height -1
                   positionX = 0
                   positionY += 1
                end  
        end
        return board
end


    
