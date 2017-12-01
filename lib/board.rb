class Board

  attr_accessor :spaces

  def initialize
    @spaces = []
    create
  end

  def create
    6.times { @spaces << Array.new(7, 0) }
  end
end
