# frozen_string_literal: true
require 'strscan'
require_relative '../util'

module AdventOfCode


  LETTER_TARGETS = {
    1 => "M",
    2 => "A",
    3 => "S"
  }

  class Day4
    def initialize(input)
      Util.validate_input(input)
      @input = File.readlines(input).map { |line| line.chars}
    end

    def solve_part_one()
      @y_limit = @input.length 
      @x_limit = @input[0].length  
      num_words = 0
      @letter_factor = 1
      @input.each.with_index do |line, i|
        line.each.with_index do |letter,j|
          if letter == 'X'
            num_words += 1 if find_word(j,i,0,1) 
            num_words += 1 if find_word(j,i,1,0)
            num_words += 1 if find_word(j,i,1,1)
            num_words += 1 if find_word(j,i,-1,-1)
            num_words += 1 if find_word(j,i,0,-1)
            num_words += 1 if find_word(j,i,-1,0)
            num_words += 1 if find_word(j,i,-1,1)
            num_words += 1 if find_word(j,i,1,-1)
          end
      end
    end

      puts "words found: #{ num_words }"
    end

    def find_word(x_pos, y_pos, x_offset, y_offset)
      new_y = y_pos + (y_offset * @letter_factor)
      new_x = x_pos + (x_offset * @letter_factor)
      if new_y < 0 || new_y >= @y_limit || new_x < 0 || new_x >= @x_limit
        @letter_factor = 1
        return false
      end
      if LETTER_TARGETS[@letter_factor] == @input[new_y][new_x] && @letter_factor == 3
        @letter_factor = 1
        return true 
      elsif LETTER_TARGETS[@letter_factor] == @input[new_y][new_x]
        @letter_factor += 1
        return find_word(x_pos,y_pos,x_offset,y_offset)
      end
      @letter_factor = 1
      return false
    end

  end
end