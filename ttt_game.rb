class Board
    attr_accessor :board

    @@winner=nil
    @@end_game=false

    def initialize(p1,p2)
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
        @p1 = p1
        @p2 = p2
        game
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

    def game
        main_p = @p1
        empty_positions=[1,2,3,4,5,6,7,8,9]

        until @@end_game
            show_board
            puts ("Please, choose your position of a mark:")
            chosen_position=gets.chomp.to_i
            if empty_positions.include?(chosen_position)
                empty_positions.delete(chosen_position)
                @board[chosen_position-1] = main_p.mark

            check_for_win(main_p)
            check_for_tie(empty_positions)

            main_p = @p1 ? main_p = @p2 : main_p = p1
            end
        end

        show_winner
    end

    def check_for_win(main_p)
        combos = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
        ]

        combos.each do |combo|
            combo_arr = []
            combo.each do |pos|
                combo_arr.push(@board[pos])
            end
        end

        if combo_arr.join =~ /#{main_p.mark}{3}/
            @@winner = main_p
            @@end_game = true
        end
    end

    def check_for_tie
        if empty_positions.nil?
            @@end_game = true
        end
    end

    def show_winner
        show_board
        if @@winner.nil? 
            puts ("It's a tie!")
        else
            puts ("The winner is #{@@winner}! Congratz!")
        end
    end

end

class Player
    attr_accessor :score

    def initialize(player_number)
        receive_name(player_number)
        recieve_mark
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

def clear
    print "\e[2J\e[H"
end