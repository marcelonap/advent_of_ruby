require 'strscan'
module AdventOfCode
    class Day3
        def initialize(input)
            raise ArgumentError, "Input must be a File object" unless input.is_a?(File)
            raise ArgumentError, "Input file must be a .txt file" unless input.path.end_with?('.txt')
            @input = File.read(input)
            @part_one_sum = 0
            @part_two_sum = 0
        end

        def solve_part_one
            regex = /mul\((\d{1,3})\,(\d{1,3})\)/
            matches = @input.scan regex
            matches.each do |match|
                num1 = match[0].to_i
                num2 = match[1].to_i
                @part_one_sum += (num1 * num2)
            end
            @part_one_sum
        end

        def solve_part_two
            multiply = true
            scanner = StringScanner.new(@input)
            until scanner.eos?
                scanner.skip(/\s+/)
                if scanner.scan(/do\(\)/)
                    multiply = true
                elsif scanner.scan(/don't\(\)/)
                    multiply = false
                elsif scanner.scan(/mul\((\d{1,3}),(\d{1,3})\)/)
                    if multiply
                      num1, num2 = scanner[1].to_i, scanner[2].to_i
                      @part_two_sum += num1 * num2
                    end
                else
                    scanner.getch
                end
            end
            @part_two_sum
        end

    end
end
