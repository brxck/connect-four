require_relative "board"

class ConnectFour
  attr_accessor :turn

  def initialize
    @player = 1
    @board = Board.new
  end

  def play
    winner = turn_loop
    puts winner ? "draw" : "player #{@player} wins"
  end

  def turn_loop
    count = 0
    until count == 42
      @board.draw
      prompt
      winner = @board.check
      return winner if winner
      change_player
      count += 1
    end
    nil
  end

  def change_player
    @player = 1 if @player == -1
    @player = -1 if @player == 1
  end

  def prompt
    "Input column:"
    input = gets.chomp.to_i
    @board.drop_piece(input, @player)
  end
end

game = ConnectFour.new
game.play