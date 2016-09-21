class Board
  attr_accessor :board

  WINNING_COMBINATIONS = [
    # Add the remaining winning combinations.
    # Think: Which positions on the board need
    # to be occupied in order for there to be a winner?

    [0, 1, 2],
    [3, 4, 5],
  ]

  POSITIONS = {
    # Fill in the remaining positions and their corresponding
    # locations on the board.
    #
    # The keys represent the user's input, while the values are where
    # the user's X or O will be placed on the board.

    "top left" => 0,
    "top middle" => 1,
  }

  def initialize
    # Array.new() needs a number passed in so that
    # the board starts with the right amount of empty
    # spaces.

    @board = Array.new() { Cell.new }
  end

  def winner?
    winner = false

    WINNING_COMBINATIONS.each do |combination|
      first_cell = board[combination[0]].value
      second_cell = board[combination[1]].value
      third_cell = board[combination[2]].value
      consideration = [first_cell, second_cell, third_cell]

      winner = true if consideration.uniq.length == 1 && first_cell.is_a?(String)
    end

    winner
  end

  def available_cells
    board.select { |cell| cell.value == :blank }
  end

  def display
    rows = board.each_slice(3).to_a

    rows.each do |row|
      p row.map(&:value)
    end
  end
end
