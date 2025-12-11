require 'set'
file_name = '7_input.txt'
input = File.read(file_name)

def part_1 input
  splits = 0

  grid = []
  input.split(/\n/).each do |instruction|
    grid << instruction.chars
  end

  beams = Set.new
  grid.each do |row|
    if row.index('S')
      beams.add(row.index('S'))
    end
    indices = row.each_index.select { |i| row[i] == '^' }
    indices.each do |index|
      if beams.include?(index)
        beams.add(index - 1)
        beams.add(index + 1)
        beams.delete(index)
        splits += 1
      end
    end
  end

  puts splits
end

def part_2 input
  paths = 0

  grid = []
  input.split(/\n/).each do |instruction|
    grid << instruction.chars
  end

  paths = Hash.new(0)
  beams = Set.new
  grid.each do |row|
    if row.index('S')
      paths[row.index('S')] = 1
      beams.add(row.index('S'))
      next
    end

    indices = row.each_index.select { |i| row[i] == '^' }
    indices.each do |index|
      if beams.include?(index)
        beams.add(index - 1)
        beams.add(index + 1)
        beams.delete(index)

        paths[index - 1] += paths[index]
        paths[index + 1] += paths[index]
        paths[index] = 0
      end
    end
  end
  puts paths.values.sum
end

part_1(input)
part_2(input)