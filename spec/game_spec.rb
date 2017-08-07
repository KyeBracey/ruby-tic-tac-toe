require 'game'

describe Game do
  subject(:game) { described_class.new }

  it 'Begins with an empty board' do
    expect(game.board).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
  end

  describe '#start' do
    it 'prints an empty board and some instructions' do
      expect(STDOUT).to receive(:puts).with('Welcome to Tic Tac Toe!')
      expect(STDOUT).to receive(:puts).with("Enter 'game.play(n)' to take a turn, where n is the grid space you want to claim")
      expect(STDOUT).to receive(:puts).with('Below is the board with the field numbers shown - remember them well!')
      expect(STDOUT).to receive(:puts).with('|0|1|2|')
      expect(STDOUT).to receive(:puts).with('|3|4|5|')
      expect(STDOUT).to receive(:puts).with('|6|7|8|')
      expect(STDOUT).to receive(:puts).with('X: your turn!')
      game.start
    end
  end

  describe '#play' do
    it 'updates the specified field with "X" on the first turn' do
      game.play(0)
      expect(game.board).to eq([:X, nil, nil, nil, nil, nil, nil, nil, nil])
    end

    it 'updates the specified field with "X" on the first turn and "0" on the second turn' do
      game.play(5)
      game.play(8)
      expect(game.board).to eq([nil, nil, nil, nil, nil, :X, nil, nil, :O])
    end

    it 'prints the updated board' do
      expect(STDOUT).to receive(:puts).with('| | | |')
      expect(STDOUT).to receive(:puts).with('| |X| |')
      expect(STDOUT).to receive(:puts).with('| | | |')
      game.play(4)
      expect(STDOUT).to receive(:puts).with('|O| | |')
      expect(STDOUT).to receive(:puts).with('| |X| |')
      expect(STDOUT).to receive(:puts).with('| | | |')
      game.play(0)
    end

    it 'throws an error if the field is already taken' do
      game.play(0)
      expect { game.play(0) }.to raise_error('Cannot claim a field which is already taken - please try again')
    end
  end
end
