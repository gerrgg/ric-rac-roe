require './board'
require './player'

class TicTacToe
  def initialize
    @game_over = false
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @turn = 0
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


  def getInput
    puts "\n\n"
    @board.display
    puts "\nTurn #{@turn}: \n"
    x = getOneTwoOrThree(0, 'row')
    y = getOneTwoOrThree(0, 'column')
    
    {x: x, y: y}
  end
  

  def play
    while !@game_over do
      validMove = false

      if ! validMove
        @turn += 1
        while ! validMove do
          input = getInput()
          validMove = @board.validMove?(input)
          if ! validMove
            puts "invalid move!\n"
          end
        end
      end
      player = @turn % 2 == 0 ? @player2 : @player1

      @board.place(player.symbol, input)
    
      winner = @board.winner?
    
      if !winner.nil?
        puts "\nwe've got a winner! Grats #{winner}!"
        @board.display
        exit
      end
    end
  end
end

game = TicTacToe.new
game.play()
