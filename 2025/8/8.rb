file_name = '8_test_input.txt'
input = File.read(file_name)

def part_1 input
  input.split(/\n/).each do |instruction|
    puts instruction
  end
end

def part_2 input
end

part_1(input)
part_2(input)