class Game
  attr_reader :board

  def initialize
    @board = Array.new(9)
  end

  def start
    puts '| | | |'
    puts '| | | |'
    puts '| | | |'
  end
end
