describe Board do
  
      subject(:board) { Board.new }
  
      describe "#create" do
        it "creates an empty 7x6 board" do
          board.create
          expect(board.spaces).to eq([[0, 0, 0, 0, 0, 0, 0],
                                      [0, 0, 0, 0, 0, 0, 0],
                                      [0, 0, 0, 0, 0, 0, 0],
                                      [0, 0, 0, 0, 0, 0, 0],
                                      [0, 0, 0, 0, 0, 0, 0],
                                      [0, 0, 0, 0, 0, 0, 0]])
        end
      end
    end