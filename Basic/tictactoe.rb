class Player
  def initialize(number, mark)
    @number = number
    @mark = mark
  end

  attr_reader :number, :mark
end

class Board
  def initialize
    @board = {
      1=> "1",
      2=> "2",
      3=> "3",
      4=> "4",
      5=> "5",
      6=> "6",
      7=> "7",
      8=> "8",
      9=> "9"
    }
  end
  
  def pick(number, mark) 
    if @board[number] and @board[number] != "X" and @board[number] != "O"
      @board[number] = mark
      return true
    end
    false
  end

  
  def show
    puts "   #{@board[7]} ║ #{@board[8]} ║ #{@board[9]} "
    puts "  ═══╬═══╬═══"
    puts "   #{@board[4]} ║ #{@board[5]} ║ #{@board[6]} "
    puts "  ═══╬═══╬═══"
    puts "   #{@board[1]} ║ #{@board[2]} ║ #{@board[3]} "
  end


  def check_winner
    winner = check_rows + check_columns + check_diagonal
    if winner.length == 1
      return winner
    end
    ""
  end

  private

  def check_diagonal
    res =  @board[1] + @board[5] + @board[9]
    if res == "XXX"
      return "X"
    elsif res == "OOO"
      return "O"
    end
    res =  @board[7] + @board[5] + @board[3]
    if res == "XXX"
      return "X"
    elsif res == "OOO"
      return "O"
    end
    ""
  end

  def check_rows
    [1,4,7].each do |s|
      res =  @board[s] + @board[s+1] + @board[s+2]
      if res == "XXX"
        return "X"
      elsif res == "OOO"
        return "O"
      end
    end
    ""
  end

  def check_columns
    3.times do |s|
      res = @board[s+1] + @board[s+4] + @board[s+7]
      if res == "XXX"
        return "X"
      elsif res == "00O"
        return "O"
      end
    end
    ""
  end
end


class Game
  def initialize
    @board = Board.new
    @player_1 = Player.new(1, "X")
    @player_2 = Player.new(2, "O")
    @rounds = 0
    @current_player = @player_1
  end

  def round
    res = false
    until res do
      @board.show
      puts "\nPlayer #{@current_player.number} turn, pick a spot to put a #{@current_player.mark}"
      pick = get_pick
      res = @board.pick(pick, @current_player.mark)
    end
    @rounds += 1
  end

  def get_pick
    pick = gets.chomp
    if pick.length == 1
      pick = pick.to_i
    end
  end
  def play

    while check_rounds and @board.check_winner == ""
      round
      change_player
    end

    if @board.check_winner != ""
      change_player
      handle_winning
      return
    end
    nobody_wins
  end
  
  def check_rounds
    if @rounds == 9 and @board.check_winner == ""
      nobody_wins
      return false
    end
    true
  end

  def nobody_wins
    puts "╔═════════════╗"
    puts "║ NOBODY WINS ║"
    puts "╚═════════════╝"
    @board.show
  end
  def handle_winning
    puts "╔═════════════╗"
    puts "║   #{@current_player.mark} WINS    ║"
    puts "╚═════════════╝"
    @board.show
  end

  def change_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end
  
end

game = Game.new
game.play





