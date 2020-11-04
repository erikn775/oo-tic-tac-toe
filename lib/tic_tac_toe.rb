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
        @board[input_to_index] == " " && input_to_index.between?(0..8)
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
        x_array = []
        o_array = []
        @board.each_with_index do |move, index|
            if move == "X"
                x_array.push(index)
            end
            if move == "O"
                o_array.push(index)
            end
        end
        WIN_COMBINATIONS.each do |combo|
            if x_array.include?(combo)
                return combo.join
            elsif o_array.include?(combo)
                return combo.join
            end
        end
        return false
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
            return current_player
        else
            return nil
        end
    end

    def play 

    end

end