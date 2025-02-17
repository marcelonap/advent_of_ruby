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
      @y_limit = @input.length 
      @x_limit = @input[0].length  
    end

    def input
      @input
    end

    def solve_part_one
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
      num_words 
    end

    def solve_part_two
      num_words = 0
      @input.each.with_index do |line, i|
        line.each.with_index do |letter,j|
          if letter == 'A'
            unless i - 1 < 0 || i + 1 >= @y_limit || j - 1 < 0 || j + 1 >= @x_limit then
              lr_check = false
              rl_check = false 
              value_one =  @input[i - 1][j - 1] 
              case value_one
              when "M"
                lr_check =  @input[i + 1][j + 1] == "S"
              when "S"
                lr_check = @input[i + 1][j + 1] == "M"
              end
              value_two = @input[i + 1][j - 1]
              case value_two
              when "M"
                rl_check =  @input[i - 1][j + 1] == "S"
              when "S"
                rl_check = @input[i - 1][j + 1] == "M"
              end
              num_words += 1 if lr_check && rl_check
            end
          end
        end 
      end
      num_words
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