require './board'
require './player'
require './ai'

class TicTacToe
  attr_reader :player2

  def initialize
    @game_over = false
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Ai.new('O')
    @turn = 1
  end
  

  def play
    while !@game_over do
      validMove = false
      player = @turn % 2 == 0 ? @player2 : @player1

      if ! validMove
        while ! validMove do
          input = player == @player2 ? player.move(@board) : player.getInput(@board, @turn)
          validMove = @board.validMove?(input)
          if ! validMove
            puts "invalid move!\n"
          end
        end
      end
      
      @board.place(player.symbol, input)
      winner = @board.winner?
      
      if !winner.nil?
        @board.display
        puts "\nwe've got a winner! Grats #{winner}!"
        exit
      end
      
      @turn += 1
    end
  end
end

game = TicTacToe.new
# p game.inspect
p game.player2.class
game.play()

