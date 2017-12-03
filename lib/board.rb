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

  def check
    (0..6).each do |x|
      (0..5).each do |y|
        winner = space_check(x, y)
        return winner if winner
      end
    end
    nil
  end

  # Sorry, not sure how to shorten this one...
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def space_check(x, y, check_value = nil, count = 0, dir = nil)
    space = @spaces[x][y]
    return nil if space.zero? || space.nil?

    check_value = space if check_value.nil?
    return nil if space != check_value

    count += check_value
    return count if [4, -4].include?(count)

    # We actually want to do all calls when dir = nil
    # rubocop:disable Lint/DuplicateCaseCondition
    case dir
    when :column, nil
      space_check(x + 1, y, check_value, count, :column) unless @spaces[x + 1].nil?
    when :row, nil
      space_check(x, y + 1, check_value, count, :row) unless @spaces[x][y + 1].nil?
    when :rdiag, nil
      space_check(x + 1, y + 1, check_value, count, :rdiag) unless @spaces[x][y + 1].nil?
    when :ldiag, nil
      space_check(x - 1, y - 1, check_value, count, :ldiag) unless @spaces[x][y + 1].nil?
    end
  end
end
