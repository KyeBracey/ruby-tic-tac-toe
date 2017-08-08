class Game
  attr_reader :board, :winner

  WINNING_ROWS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @players = [:X, :O]
    @current_turn = @players[0]
    @in_progress = false
  end

  def start
    @winner = nil
    @in_progress = true
    @board = Array.new(9)
    print_instructions
  end

  def play(field)
    fail 'Please enter a number between 0-8 inclusive' unless field >= 0 && field <= 8
    fail "Game is not in progress - please use 'game.start' to begin" unless in_progress?
    fail 'Cannot claim a field which is already taken - please try again' unless @board[field].nil?
    update(field)
  end

  def in_progress?
    @in_progress
  end

  private
  def update(field)
    @board[field] = @current_turn
    print_board
    switch_turns
    finish_if_game_over
  end

  def finish_if_game_over
    @in_progress = false if winning_player || !board.include?(nil)
    puts "Game over! #{winning_player} wins!" if winning_player
    puts 'Game over! Nobody wins.' unless winning_player || board.include?(nil)
  end

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

  def winning_player
    x_fields = @board.each_index.select { |i| @board[i] == :X }
    o_fields = @board.each_index.select { |i| @board[i] == :O }
    return @winner = :X if WINNING_ROWS.any? { |set| (set - x_fields).empty? }
    @winner = :O if WINNING_ROWS.any? { |set| (set - o_fields).empty? }
  end

  def switch_turns
    @current_turn = @players.select { |player| player != @current_turn }.first
  end
end
