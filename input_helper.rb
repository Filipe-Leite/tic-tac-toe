module InputHelper
    SAFE_WORDS =['QUIT', 'EXIT']

    def prompt(string)
        print(string + "\n> ")
    end

    def gets
        input = Kernel.gets

        if SAFE_WORDS.include?(input.chomp.strip.downcase)
            puts "User quit."
            puts "Goodbye."
            exit
        end
        input
    end

end