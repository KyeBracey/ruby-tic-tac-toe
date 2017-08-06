require 'game'

describe Game do
  subject(:game) { described_class.new }

  describe '#start' do
    it 'prints an empty board' do
      3.times { expect(STDOUT).to receive(:puts).with('| | | |') }
      game.start
    end
  end
end
