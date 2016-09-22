require_relative "board"
require_relative "cell"

def initialize_board
  @board = Board.new
end

def choose_characters
  puts "X or O?"
  @player = gets.chomp
  # Fix thise case statement such that when the player enters
  # X, the computer is assigned O. And vice versa.
  #
  # If the player chooses neither X nor O, give assign
  # the computer a character of your choice.

  @computer = case @player
              when "" then ""
              when "" then ""
              else
                ""
              end
end

def play
  until @board.winner?
    puts "Make a move: "
    board_index = Board::POSITIONS[gets.chomp]
    winner = @player

    @board.board[board_index].value = @player

    unless @board.winner?
      @board.available_cells.sample.value = @computer
      winner = @computer if @board.winner?
    end

    @board.display

    if @board.winner?
      # Modify the string below to also display the
      # name of the winner.
      puts "WINNER!!!"
      puts "Do you want to play again?"

      start_game if gets.chomp == "Yes"
    else
      play
    end
  end
end

def start_game
  initialize_board
  choose_characters
  play
end

start_game
