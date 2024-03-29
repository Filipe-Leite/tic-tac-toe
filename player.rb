require_relative 'input_helper'

class Player

    include InputHelper

    ROW_MAP = (:A..:C).zip(0..2).to_h
    TRANSLATORS = {
        row: ->(input) {ROW_MAP[input[0].upcase.to_sym]},
        column: ->(input) {input.to_i - 1}
    }

    attr_reader :name, :marker, :score

    def score
        @score
    end

    def score=(new_val)
        @score = new_val
    end

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_move
        TRANSLATORS.map do |row_or_column, translator| 
            get_coordinate(row_or_column, translator)
        end
    end

    def increment_score
        @score += 1
    end

    private
    def get_coordinate(row_or_column, translator)
        loop do
            prompt "Pick a #{row_or_column}: "
            input = gets
            choice = translator.call(input)
            return choice if in_bounds?(choice)
            puts "Invalid #{row_or_column}."
        end
    end

    def prompt_choice(row_or_column)
        "pick a #{row_or_column}\n> "
    end

    def in_bounds?(choice)
        (0..2).include?(choice)
    end
end