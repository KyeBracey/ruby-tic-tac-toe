require 'game'

describe Game do
  subject(:game) { described_class.new }

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

    it 'clears the board if the game was in progress' do
      game.start
      game.play(0)
      game.start
      expect(game.board).to eq(Array.new(9))
    end
  end

  describe '#play' do
    it 'updates the specified field with "X" on the first turn' do
      game.start
      game.play(0)
      expect(game.board).to eq([:X, nil, nil, nil, nil, nil, nil, nil, nil])
    end

    it 'updates the specified field with "X" on the first turn and "0" on the second turn' do
      game.start
      game.play(5)
      game.play(8)
      expect(game.board).to eq([nil, nil, nil, nil, nil, :X, nil, nil, :O])
    end

    it 'prints the updated board' do
      game.start
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
      game.start
      game.play(0)
      expect { game.play(0) }.to raise_error('Cannot claim a field which is already taken - please try again')
    end

    it 'throws an error if the game has not been started' do
      expect { game.play(0) }.to raise_error("Game is not in progress - please use 'game.start' to begin")
    end

    it 'throws an error if the passed-in number is not between 0 and 8' do
      game.start
      expect { game.play(10) }.to raise_error('Please enter a number between 0-8 inclusive')
      expect { game.play(-1) }.to raise_error('Please enter a number between 0-8 inclusive')
    end
  end

  describe '#in_progress?' do
    it 'returns false if a game has not been started' do
      expect(game.in_progress?).to eq(false)
    end

    it 'returns true after a game is started' do
      game.start
      expect(game.in_progress?).to eq(true)
    end

    it 'returns false if a player has won' do
      game.start
      game.play(0)
      game.play(3)
      game.play(1)
      game.play(4)
      game.play(2)
      expect(game.in_progress?).to eq(false)
    end
  end

  describe '#winner' do
    it 'Returns nil at the start of the game' do
      game.start
      expect(game.winner).to eq(nil)
    end
  end
end
