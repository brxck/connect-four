# rubocop:disable Style/BlockLength

require "board"

describe Board do
  subject(:board) { described_class.new }

  let(:answer) { [] }

  describe "#create" do
    # Example is only "too long" because of multi-line array
    # rubocop:disable RSpec/ExampleLength
    it "creates an empty 7x6 board" do
      expect(board.spaces).to eq([[0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0]])
    end
  end

  describe "#drop_piece(column, player)" do
    it "places piece at the bottom of the column" do
      (0..7).each { |i| board.drop_piece(i, 1) }
      expect(board.spaces).to eq([[1, 0, 0, 0, 0, 0],
                                  [1, 0, 0, 0, 0, 0],
                                  [1, 0, 0, 0, 0, 0],
                                  [1, 0, 0, 0, 0, 0],
                                  [1, 0, 0, 0, 0, 0],
                                  [1, 0, 0, 0, 0, 0],
                                  [1, 0, 0, 0, 0, 0]])
    end

    it "places pieces on top of others" do
      (0..7).each { |i| board.drop_piece(i, 1) }
      (0..7).each { |i| board.drop_piece(i, -1) }
      expect(board.spaces).to eq([[1, -1, 0, 0, 0, 0],
                                  [1, -1, 0, 0, 0, 0],
                                  [1, -1, 0, 0, 0, 0],
                                  [1, -1, 0, 0, 0, 0],
                                  [1, -1, 0, 0, 0, 0],
                                  [1, -1, 0, 0, 0, 0],
                                  [1, -1, 0, 0, 0, 0]])
    end

    it "returns the location of the placed piece" do
      3.times { answer << board.drop_piece(0, 1) }
      expect(answer).to eq([[0, 0], [0, 1], [0, 2]])
    end

    it "does not accept columns below [0]" do
      expect(board.drop_piece(-1, 1)).to eq(nil)
    end

    it "does not accept columns above [6]" do
      expect(board.drop_piece(7, 1)).to eq(nil)
    end

    it "does not accept invalid players" do
      expect(board.drop_piece(1, 58)).to eq(nil)
    end
  end

  describe "#column_check" do
    it "connects four vertically" do
      4.times { board.drop_piece(5, 1) }
      expect(board.column_check).to eq(4)
    end
  end

  describe "#row_check" do
    it "connects four horizonally" do
      4.times { |i| board.drop_piece(i, -1) }
      expect(board.row_check).to eq(-4)
    end
  end
end
