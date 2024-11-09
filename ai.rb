class Ai
  attr_reader :symbol

  def initialize(symbol, ai = false)
    @symbol = symbol
  end

  def move(board)
    available_moves = []

    # Collect all the available spots on the grid
    board.grid.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        available_moves << { x: x + 1, y: y + 1 } if cell.nil?
      end
    end

    # Select a random available move
    move = available_moves.sample
    puts "AI chooses (#{move[:x]}, #{move[:y]})"
    move
  end

end