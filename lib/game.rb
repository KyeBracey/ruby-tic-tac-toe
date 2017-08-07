class Game
  attr_reader :board

  def initialize
    @players = [:X, :O]
    @current_turn = @players[0]
    @in_progress = false
  end

  def start
    @in_progress = true
    @board = Array.new(9)
    print_instructions
  end

  def play(field)
    fail "Game is not in progress - please use 'game.start' to begin" unless in_progress?
    fail 'Cannot claim a field which is already taken - please try again' unless @board[field].nil?
    @board[field] = @current_turn
    print_board
    switch_turns
  end

  def in_progress?
    @in_progress
  end

  private
  def print_board_with_numbers
    puts '|0|1|2|'
    puts '|3|4|5|'
    puts '|6|7|8|'
  end

  def print_board
    board = @board.map { |value| value.nil? ? " " : value.to_s }
    puts "|#{board[0]}|#{board[1]}|#{board[2]}|"
    puts "|#{board[3]}|#{board[4]}|#{board[5]}|"
    puts "|#{board[6]}|#{board[7]}|#{board[8]}|"
  end

  def print_instructions
    puts 'Welcome to Tic Tac Toe!'
    puts "Enter 'game.play(n)' to take a turn, where n is the grid space you want to claim"
    puts 'Below is the board with the field numbers shown - remember them well!'
    print_board_with_numbers
    puts 'X: your turn!'
  end

  def switch_turns
    @current_turn = @players.select { |player| player != @current_turn }.first
  end
end
