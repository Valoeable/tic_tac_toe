class Board
    attr_accessor :board

    @@winner=false

    def initialize(p1,p2)
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
        @p1 = p1
        @p2 = p2
    end

    def show_board
        r1 = "|#{@board[0]}|#{@board[1]}|#{@board[2]}|"
        r2 = "|#{@board[3]}|#{@board[4]}|#{@board[5]}|"
        r3 = "|#{@board[6]}|#{@board[7]}|#{@board[8]}|"
        divide = '---+---+---'
        puts r1
        puts divide
        puts r2
        puts divide
        puts r3
    end
end

class Player
    attr_accessor :score

    def initialize(player_number)
        receive_name(player_number)
        recieve_mark
        @score = 0
    end

    def clear
        print "\e[2J\e[H"
    end

    def recieve_name
        clear
        puts "Player #{player_number}, please select your name:"
        @name = gets.chomp
    end

    def recieve_mark
        clear
        puts "Player #{player_number}, please select your mark:"
        @mark = gets.chomp
    end
end
