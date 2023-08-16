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
        loop do
            prompt_choice("row")
            input = gets
            choice = translate_row(input)
            return choice if in_bounds?(choice)
            puts "Invalid row."
        end
    end

    def get_col
        loop do
            prompt_choice("column")
            input = gets
            choice = translate_col(input)
            return choice if in_bounds?(choice)
            puts "Invalid column"
        end
    end

    def translate_row(input)
        ROW_MAP[input[0].upcase.to_sym]
    end

    def translate_col(input)
        input.to_i - 1
    end

    def prompt_choice(string)
        puts "pick a #{string}"
        print "> "
    end

    def in_bounds?(choice)
        (0..2).include?(choice)
    end
end