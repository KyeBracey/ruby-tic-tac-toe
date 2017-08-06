class Game
  attr_reader :board

  def initialize
    @board = Array.new(9)
    @players = [:X, :O]
    @current_turn = @players[0]
  end

  def start
    print_board
  end

  def play(field)
    @board[field] = @current_turn
    @current_turn = @players.select { |player| player != @current_turn }.first
  end

  private
  def print_board
    board = @board.map { |value| " " if value.nil? }
    puts "|#{board[0]}|#{board[1]}|#{board[2]}|"
    puts "|#{board[3]}|#{board[4]}|#{board[5]}|"
    puts "|#{board[6]}|#{board[7]}|#{board[8]}|"
  end
end
