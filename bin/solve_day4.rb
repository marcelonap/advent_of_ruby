#!/usr/bin/env ruby
require_relative '../lib/day4'

input_path = File.join(__dir__, "../input/day_4_input.txt")
input = File.open(input_path)

solver = AdventOfCode::Day4.new(input)

solver.solve_part_one