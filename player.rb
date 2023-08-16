class Player

    ROW_MAP = (:A..:C).zip(0..2).to_h

    attr_reader :marker

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_move
        [get_row,get_col]
    end

    def get_row
        choice_prompt("row")
        
        ROW_MAP[gets[0].upcase.to_sym]
    end

    def get_col
        choice_prompt("column")
        gets.to_i - 1
    end

    def choice_prompt(string)
        puts "pick a #{string}"
        print "> "
    end
end