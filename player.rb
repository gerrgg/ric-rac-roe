class Player
  attr_reader :symbol

  def initialize(symbol, ai = false)
    @symbol = symbol
  end
  
  def getOneTwoOrThree(x, target)
    while ! (1..3).include?(x)
      puts "What #{target} 1, 2 or 3?\n"
      x_input = gets.chomp

      if x_input == "exit"
        exit
      end

      if (1..3).include?(x_input.to_i)
        x = x_input.to_i
      else
        puts "invalid, need a 1, 2 or a 3 bud.\n"
      end
    end

    x
  end


  def getInput(board, turn)
    puts "\n\n"
    board.display
    puts "\nTurn #{turn}: \n"
    x = getOneTwoOrThree(0, 'row')
    y = getOneTwoOrThree(0, 'column')
    
    {x: x, y: y}
  end

end