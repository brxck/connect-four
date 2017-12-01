class Board
  def initialize
    @spaces = []
  end

  def create
    6.times { @space << Array.new(7, 0) }
  end
end