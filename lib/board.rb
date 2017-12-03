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
    return nil if x < 0 || x > 6 || ![1, -1].include?(player)
    @spaces[x].each_with_index do |space, y|
      if space.zero?
        @spaces[x][y] = player
        return [x, y]
      end
    end
  end

  def column_check
    @spaces.each do |column|
      (0..2).each do |y|
        sum = column[y..y + 3].reduce(:+)
        return sum if [4, -4].include?(sum)
      end
    end
    nil
  end

  def row_check
    (0..5).each do |y|
      row = []
      (0..3).each do |x|
        4.times { |i| row << @spaces[x + i][y] }
        sum = row.reduce(:+)
        return sum if [4, -4].include?(sum)
      end
    end
  end
end
