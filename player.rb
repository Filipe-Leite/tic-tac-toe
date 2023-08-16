class Player

    ROW_MAP = (:A..:C).zip(0..2).to_h
    TRANSLATIONS = {
        row: ->(input) {ROW_MAP[input[0].upcase.to_sym]},
        column: ->(input) {input.to_i - 1}
    }

    attr_reader :marker

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_move
        TRANSLATIONS.map do |row_of_column, translator| 
            get_coordinate(row_or_column, translator)
        end
    end

    private
    # def get_row
    #     loop do
    #         prompt_choice("row")
    #         input = gets
    #         choice = translate_row(input)
    #         return choice if in_bounds?(choice)
    #         puts "Invalid row."
    #     end
    # end

    def get_coordinate(row_or_column, translator)
        loop do
            print prompt_choice(row_or_column)
            input = gets
            choice = translator.call(input)
            # method_to_call = "translate_#{row_or_column}".to_sym
            # choice = send(method_to_call, input)
            return choice if in_bounds?(choice)
            puts "Invalid #{row_or_column}"
        end
    end

    # def get_column
    #     loop do
    #         prompt_choice("column")
    #         input = gets
    #         choice = translate_column(input)
    #         return choice if in_bounds?(choice)
    #         puts "Invalid column"
    #     end
    # end

    # def translate_row(input)
    #     ROW_MAP[input[0].upcase.to_sym]
    # end

    # def translate_column(input)
    #     input.to_i - 1
    # end

    # def translate(input, row_or_column)
    #     case row_or_column
    #     when "row"
    #         translate_row(input)
    #     when "column0"
    #         translate_column(input)
    #     else
    #         puts "oh no"
    #     end
    # end

    def prompt_choice(row_or_column)
        "pick a #{row_or_column}\n> "
    end

    def in_bounds?(choice)
        (0..2).include?(choice)
    end
end