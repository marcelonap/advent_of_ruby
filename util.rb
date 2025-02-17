class Util 
  def self.validate_input(input)
    raise ArgumentError, "Input must be a File object" unless input.is_a?(File)
    raise ArgumentError, "Input file must be a .txt file" unless input.path.end_with?('.txt')
  end

end