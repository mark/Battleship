class Ship
  
  attr_reader :coords
  
# get starting coordinates, direction, and ship length
#create an array for the coordinates of the ship. 
# ship starting at (x,y), next tile @ (x+1, y), next (x+2, y)
#(x+3, y), (x+4, y)

  DELTAS = { :up => [0, -1], :down => [0, 1], :left => [-1, 0], :right => [1, 0] }
  
  def initialize(name, start_coord, direction, ship_length)
    @name = name
    @start_coord = start_coord
    @coords = []
        
    x_incrementer, y_incrementer = DELTAS[ direction ]

    ship_length.times do |i|

      x = @start_coord[0] + (x_incrementer * i)
      y = @start_coord[1] + (y_incrementer * i)
      
      @coords << [x, y]
    end
  end
  
  def anchored?(coord)
    @coords.include?(coord)
  end
  
  def symbol
    @name[0,1]
  end
  
  def called(x, y)
    @coords.delete [x,y]

    if sunk?
      `say 'You sank my #{@name}'`
    end
  end

  def sunk?
    @coords.empty?
  end
  
end

#define the ships
