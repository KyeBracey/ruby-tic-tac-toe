require 'game'

describe Game do
  subject(:game) { described_class.new }

  it 'Begins with an empty board' do
    expect(game.board).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
  end

  describe '#start' do
    it 'prints an empty board' do
      3.times { expect(STDOUT).to receive(:puts).with('| | | |') }
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
  end
end
