class Board
    WIDTH = 3
    HEIGHT = WIDTH

    def initialize
        @grid = Array.new(HEIGHT) { Array.new(WIDTH,:" ")}
    end

    def winner?(marker)
        row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
    end

    def [](y,x)
        @grid[y][x]
    end

    def []=(y,x,marker)
        if @grid[y][x] == :" " && [:X,:O].include?(marker)
            @grid[y][x] = marker
        else
            false
        end
    end

    def display
        output = "\n"

        # TODO: Append header
        output << generate_header
        # TODO: Generate grid with letter for each row
        output << generate_rows
        output << "\n"
    end

    private
    def format_row(row,letter)
        row.reduce("  #{letter} ") { |string, cell| string << "[#{cell}]" }  << "\n"
    end

    def generate_header
        (1..WIDTH).reduce("   ") { |header, n| header << "  #{n}" } << "\n"
    end

    def generate_rows
        letter = "@"

        @grid.reduce("") do |output, row|
            letter = letter.next
            output << format_row(row, letter)
        end
    end

    def row_win?(marker)
        @grid.any? do |row|
            row.all? do |cell|
                cell == marker
            end    
        end
    end

    def column_win?(marker)
        (0...WIDTH).any? do |column|
            @grid.all? do |row|
                row[column] == marker
            end
        end
    end

    def diagonal_win?(marker)
        [
         ->(i) { i },
         ->(i) { - (i + 1) }
        ].any? do |match_to_column|    
            (0...HEIGHT).all? do |row_index|
                # i
                # -(i+1)
                # second_index = sign > 0 ? i : sign * (i+1)
                @grid[row_index][match_to_column.call(row_index)] == marker
            end
        end
    end
end

# A1 => [0,0]

# def print_and_check
#     @b.display
#     p "Row with all Os?: #{@b.row_win?(:O)}"
#     p "Row with all Xs?: #{@b.row_win?(:X)}"
#     p "Column with all Os?: #{@b.column_win?(:O)}"
#     p "Column with all Xs?: #{@b.column_win?(:X)}"
#     p "Diagonal with all Os?: #{@b.diagonal_win?(:O)}"
#     p "Diagonal with all Xs?: #{@b.diagonal_win?(:X)}"
# end

# @b = Board.new
# print_and_check
# # b.grid[0][1] = :X
# # b.grid[0][1].replace("X")
# # b.grid[0][1].replace(:"X").downcase!
# # b.grid[0][1] = :"X"
# @b[0][0] = :X
# print_and_check

# @b[1][1] = :X
# print_and_check

# @b[1][0] = :X
# print_and_check