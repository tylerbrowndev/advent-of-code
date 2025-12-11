file_name = '6_input.txt'
input = File.read(file_name)

def part_1 input
  sum = 0

  grid = []
  input.split(/\n/).each do |instruction|
    grid << instruction.strip.split(/\s+/)
  end

  transposed_grid = grid.transpose

  transposed_grid.each do |row|
    operator = row.last
    operands = row[0..-2].map(&:to_i)
    if operator == '+'
      sum += operands.sum
    else
      sum += operands.reduce(:*)
    end
  end

  puts sum
end

def part_2 input
  sum = 0

  grid = []
  input.split(/\n/).each do |instruction|
    grid << instruction.chars
  end

  transposed_grid = grid.transpose

  operands = []
  operator = ''
  transposed_grid.each do |row|
    if row.join.strip.length == 0
      if operator == '+'
        sum += operands.sum
      else
        sum += operands.reduce(:*)
      end
      operands = []
      next
    end
    if row.last == '+' || row.last == '*'
      operator = row.last 
      operands << row[0..-2].join.to_i
    else
      operands << row.join.to_i
    end
  end
  if operator == '+'
    sum += operands.sum
  else
    sum += operands.reduce(:*)
  end
  operands = []

  puts sum
end

part_1(input)
part_2(input)