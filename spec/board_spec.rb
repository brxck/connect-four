# rubocop:disable Style/BlockLength

require "board"

describe Board do
  subject(:board) { described_class.new }
  let(:answer) { [] }

  describe "#create" do
    # Example is only "too long" because of multi-line array
    # rubocop:disable RSpec/ExampleLength
    it "creates an empty 7x6 board" do
      expect(board.spaces).to eq([[0, 0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 0, 0, 0]])
    end
  end

  describe "#drop_piece(column, player)" do
    it "places piece at the bottom of the column" do
      (1..7).each { |i| drop_piece(i, 1) }
      expect(board.spaces[5]).to eq([1, 1, 1, 1, 1, 1, 1])
    end

    it "places pieces on top of others" do
      (1..7).each { |i| drop_piece(i, 1) }
      (1..7).each { |i| drop_piece(i, -1) }
      expect(board.spaces[4..5]).to eq([[[0, 0, 0, 0, 0, 0, 0],
                                         [1, 1, 1, 1, 1, 1, 1]]])
    end

    it "returns the location of the placed piece" do
      3.times { answer << board.drop_piece(1, 1) }
      expect(answer).to eq([[0, 0], [0, 1], [0, 2]])

    end
  
    it "does not accept invalid columns" do
      expect(board.drop_piece(-1, 1)).to eq(nil)
    end
  
  end
end