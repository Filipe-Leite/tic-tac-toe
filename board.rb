class Board

    WIDTH = 3
    HEIGHT = WIDTH

    attr_accessor :grid

    def initialize
        @grid = Array.new(HEIGHT) { Array.new(WIDTH,:" ")}
    end

    def print_grid
        @grid.each do |row|
            puts
            row.each do |cell|
                print "[#{cell}]"
            end
        end
        puts
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
         lambda {|i| i},
         lambda {|i| - (i+1)}
        ].any? do |proc|    
            (0...HEIGHT).all? do |i|
                # i
                # -(i+1)
                # second_index = sign > 0 ? i : sign * (i+1)
                @grid[i][proc.call(i)] == marker
            end
        end
    end

end

def print_and_check
    @b.print_grid
    p "Row with all Os?: #{@b.row_win?(:O)}"
    p "Row with all Xs?: #{@b.row_win?(:X)}"
    p "Column with all Os?: #{@b.column_win?(:O)}"
    p "Column with all Xs?: #{@b.column_win?(:X)}"
    p "Diagonal with all Os?: #{@b.diagonal_win?(:O)}"
    p "Diagonal with all Xs?: #{@b.diagonal_win?(:X)}"
end

@b = Board.new
print_and_check
# b.grid[0][1] = :X
# b.grid[0][1].replace("X")
# b.grid[0][1].replace(:"X").downcase!
# b.grid[0][1] = :"X"
@b.grid[0][0] = :X
print_and_check

@b.grid[1][1] = :X
print_and_check

@b.grid[1][0] = :X
print_and_check