class Board
  attr_accessor :spaces

  def initialize
    @spaces = []
    create
  end

  def create
    7.times { @spaces << Array.new(6, 0) }
  end

  def inspect
    result = ""
    @spaces.each do |row|
      result += row.to_s + "\n"
    end
    result
  end

  def draw
    print inspect
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

  def check
    return column_check if column_check
    return row_check if row_check
    return rdiag_check if rdiag_check
    return ldiag_check if ldiag_check
  end

  def column_check
    (0..6).each do |x|
      (0..2).each do |y|
        sum = @spaces[x][y..y + 4].reduce(:+)
        return sum if [4, -4].include?(sum)
      end
    end
    nil
  end

  def row_check
    (0..5).each do |y|
      (0..3).each do |x|
        sum = 0
        (0..3).each { |shift| sum += @spaces[x + shift][y] }
        return sum if [4, -4].include?(sum)
      end
    end
    nil
  end

  def rdiag_check
    (0..3).each do |x|
      (0..2).each do |y|
        sum = 0
        (0..3).each { |shift| sum += @spaces[x + shift][y + shift] }
        return sum if [4, -4].include?(sum)
      end
    end
    nil
  end

  def ldiag_check
    reversed = @spaces.reverse
    (0..3).each do |x|
      (0..2).each do |y|
        sum = 0
        (0..3).each { |shift| sum += reversed[x + shift][y + shift] }
        return sum if [4, -4].include?(sum)
      end
    end
    nil
  end
end
