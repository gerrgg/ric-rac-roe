class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def place(value, coordinates)
    grid[coordinates[:x] - 1][coordinates[:y] - 1] = value
  end

  def validMove?(coordinates)
    grid[coordinates[:x] - 1][coordinates[:y] - 1].nil?
  end

  def winner?
    # Check rows and columns
    (0..2).each do |i|
      return grid[i][0] if grid[i][0] && grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2] # Row
      return grid[0][i] if grid[0][i] && grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] # Column
    end

    # Check diagonals
    return grid[0][0] if grid[0][0] && grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2]
    return grid[0][2] if grid[0][2] && grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0]

    # No winner
    nil
  end

  def display
    # Print column labels
    puts "   1   2   3"
    puts "  ------------"
  
    # Print each row with row labels
    grid.each_with_index do |row, index|
      print "#{index + 1} | " # Row labels (1-based index)
      puts row.map { |cell| cell.nil? ? ' ' : cell }.join(' | ')
      puts "  ------------" unless index == grid.size - 1
    end
  end
end

