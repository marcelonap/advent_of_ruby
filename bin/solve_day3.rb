#!/usr/bin/env ruby
require_relative '../lib/day3'

input_path = File.join(__dir__, "../input/input.txt")
input = File.open(input_path)

solver = AdventOfCode::Day3.new(input)


puts "Part 1: #{solver.solve_part_one}"
puts "Part 2: #{solver.solve_part_two}"