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
end
