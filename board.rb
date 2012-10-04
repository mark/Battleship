class Board

  def initialize
    @size = 10
    @tiles = []
  end
  
  def tile_create # list of coordinates
    @size.times do |row|
      @size.times do |column|
        ship = @fleet.detect { |ship| ship.anchored?([row, column]) }
        
        @tiles << Tile.new(row, column, ship)
      end
    end
  end
  
  def ship_create # list of coordinates
    @fleet = [
      Ship.new("Destroyer", [0, 0], :right, 2),
      Ship.new("Aircraft Carrier", [3, 0], :right, 5),
      # Ship.new("Battleship", [5, 5], :down,  4)
    ]
    
    # Keep an array of all tiles in all ships:
    # For each ship in the fleet:
    #  take its coords
    #  add its coords to our tiles array
    
    # p "Original ship tiles: #{ @all_ship_coordinates }"
  end
  
  def draw
    #for each tile
    #print marker
    print '  | '
    @size.times do |column|
      print (column+1).to_s.ljust(2)
    end
    puts
    
    puts '--+' + '-' * 20
    
    @size.times do |row|
      print Tile::ROWS[row] + ' | '
      @size.times do |column|
        print @tiles[column * @size + row].marker + ' '
      end
      print "\n"
    end
  end
  
  def fire(tile)
    tile.called #finds the tile and called it  
    
    # if hit ship tile, remove from @all_ship_tiles array
    
    # p "Remaining ship tiles: #{ @all_ship_coordinates }"
    # p "Remaining ship tiles: " + @all_ship_coordinates.to_s
  end

  def game_over?
    # 1: goal of the game is completed
    #  when all ship tiles are hit (o)
    @fleet.all? &:sunk?
  end  
  
  def tile(coords)
    row, column = Tile.split_coords(coords)
    
    @tiles[column * @size + row] if row && column
  end
  
end