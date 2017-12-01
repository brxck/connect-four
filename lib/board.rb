class Board

  attr_accessor :spaces

  def initialize
    @spaces = []
    create
  end

  def create
    7.times { @spaces << Array.new(6, 0) }
  end

  def drop_piece(x, player)
    return nil if x < 0 || x > 6
    @spaces[x].each_with_index do |space, y|
      if space.zero?
        @spaces[x][y] = player
        return [x, y]
      end
    end
  end

  def column_check
    @spaces.each do |column|
      (0..2).each do |i|
        sum = column[i..i + 3].reduce(:+)
        return sum if [4, -4].include?(sum)
      end
    end
    nil
  end
end
