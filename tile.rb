# encoding: utf-8
class Tile

  ROWS = %w(A B C D E F G H I J)

  def self.split_coords(coord)
    if coord =~ /^([A-J])([1-9]|10)$/
      row    = ROWS.index $1
      column = $2.to_i - 1

      return row, column
    end
  end

  def initialize(row, column, ship)
    @row = row
    @column = column
    @called = false 
    @ship = ship
  end

  def marker
    if @called && @ship
      "X"
    elsif @called
      "o"
    elsif @ship
      @ship.symbol
    else
      "~"
    end
  end
  
  def called?
    @called
  end
  
  def called
    @called = true

    if @ship
      `say 'Hiht'`
      @ship.called(@row, @column) # [sic.]
    else
      `say 'Miss'`
    end
  end
  
end