require_relative '../lib/day3'

RSpec.describe AdventOfCode::Day3 do
  let(:temp_file) do
    file = File.new("test_input.txt", "w+")
    file
  end

  after do
    temp_file.close
    File.delete("test_input.txt") if File.exist?("test_input.txt")
  end

  describe '#initialize' do
    it 'raises ArgumentError if input is not a File' do
      expect { AdventOfCode::Day3.new("Not a file") }.to raise_error(ArgumentError, "Input must be a File object")
    end

  
    it 'raises ArgumentError if file is not .txt' do
      non_txt = File.new("test.csv", "w+")
      begin
        expect { AdventOfCode::Day3.new(non_txt) }.to raise_error(ArgumentError, "Input file must be a .txt file")
      ensure
        non_txt.close
        File.delete("test.csv")
      end
    end

    it 'successfully initializes with valid txt file' do
      expect { AdventOfCode::Day3.new(temp_file) }.not_to raise_error
    end
  end


  describe '#solve_part_one' do
    it 'correctly sums all multiplications' do
      temp_file.write("mul(2,3)alkasdmul(4,5)")
      temp_file.rewind
      day3 = AdventOfCode::Day3.new(temp_file)
      expect(day3.solve_part_one).to eq(26)
    end

    it 'handles whitespace between controls and multiplications' do
      temp_file.write("do() mul(2,3) mul(4,5) don't() mul(6,7) do() mul(8,9)")
      temp_file.rewind
      day3 = AdventOfCode::Day3.new(temp_file)
      expect(day3.solve_part_two).to eq(98)
    end
  end

  describe '#solve_part_two' do
    it 'starts with multiply enabled' do
      temp_file.write("mul(2,3)alkasdmul(4,5)")
      temp_file.rewind
      day3 = AdventOfCode::Day3.new(temp_file)
      expect(day3.solve_part_two).to eq(26)
    end

    it "does not multiply matches after don't()" do
      temp_file.write("mul(2,3)alkasdmul(4,5)don't()mul(3,3)")
      temp_file.rewind
      day3 = AdventOfCode::Day3.new(temp_file)
      expect(day3.solve_part_two).to eq(26)
    end

    it "continues multiplying after finding another do()" do
      temp_file.write("mul(2,3)alkasdmul(4,5)don't()mul(3,3)do()mul(2,1)")
      temp_file.rewind
      day3 = AdventOfCode::Day3.new(temp_file)
      expect(day3.solve_part_two).to eq(28)
    end 
  end

end
