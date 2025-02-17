require_relative '../lib/day4'


RSpec.describe AdventOfCode::Day4 do
  let(:temp_file) do
    input_path = File.join(__dir__, "../input/test_day_4.txt")
    input = File.open(input_path)
    input
  end

  after do
    temp_file.close
  end

  describe '#initialize' do
    it 'raises ArgumentError if input is not a File' do
      expect { AdventOfCode::Day4.new("Not a file") }.to raise_error(ArgumentError, "Input must be a File object")
    end
    
    it 'successfully initializes with valid txt file' do
      expect { AdventOfCode::Day4.new(temp_file) }.not_to raise_error
    end

    it 'stores the file as a 2d Array of lines and characters in a line' do
      day4 = AdventOfCode::Day4.new(temp_file)
      expect(day4.input[0][0] ).to eq('M') 
    end
  end

  describe '#solve_part_one' do
    it "correctly finds all the occurrences of 'xmas' in any of the 8 directions" do
      day4 = AdventOfCode::Day4.new(temp_file) 
      expect(day4.solve_part_one).to eq(18)
    end 
  end

  describe '#solve_part_one' do 
    it "correctly fins all the ocurrences of X's formed by 'MAS' in both diagonals" do
      day4 = AdventOfCode::Day4.new(temp_file) 
      expect(day4.solve_part_two).to eq(9)
    end
  end
end