require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2] ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
       puts (" X | X | X "),
            ("-----------"),
            (" X | O | O "),
            ("-----------"),
            (" X | O | O "),
            (" X | O | X "),
            ("-----------"),
            (" O | X | X "),
            ("-----------"),
            (" O | X | O ")
    end

    def input_to_index(input)
        input = input.to_i - 1
    end

    def move(index, letter)
        @board[index] = letter
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(input_to_index)
        @board[input_to_index] == " " && input_to_index.between?(0,8)
    end

    def turn_count
        counted_moves = []
        @board.each do |moves| 
            if moves != " "
                counted_moves.push(moves)
            end
        end
        counted_moves.count
    end

    def current_player
        if turn_count.odd?
            return "O"
        else 
            return "X"
        end
    end

    def turn
        user_move = input_to_index(gets.chomp)
        if valid_move?(user_move)
            @board[user_move] = current_player
        else 
            
            turn
        end
        
        display_board
        
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[0]] && @board[combo[0]] != " "
        end
    end

    def full?
        if @board.include?(" ")
            return false
        else
            return true
        end
    end

    def draw?
        until full? == true
            return false
        end
        if won?
            return false
        else
            return true
        end
    end

    def over?
        if draw?
            return true
        elsif won?
            return true
        else 
        end
    end

    def winner
        if won?
            if current_player == "X"
                return "O"
            else
                return "X"
            end
        else
            return nil
        end
    end

    def play 
        while !over?
            turn
        end
        if winner == nil
            puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end

end