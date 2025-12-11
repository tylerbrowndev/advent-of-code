file_name = '3_input.txt'
input = File.read(file_name)

def part_1 input
  joltage = 0

  input.split(/\n/).each do |instruction|
    max = 0
    max_index = 0
    instruction[0..-2].chars.each_with_index do |c, i|
      if c.to_i > max
        max = c.to_i
        max_index = i
      end
    end
    second_max = 0
    instruction[max_index+1..-1].chars.each do |c|
      if c.to_i > second_max
        second_max = c.to_i
      end
    end
    joltage += [max, second_max].join.to_i
  end

  puts joltage
end

def part_2 input
    joltage = 0

  input.split(/\n/).each do |instruction|
    batteries = []
    current_index = 0
    while batteries.length < 12
      remaining_batteries = 12 - batteries.length
      max = 0
      max_index = current_index
      instruction[current_index..-(remaining_batteries)].chars.each_with_index do |c, i|
        if c.to_i > max
          max = c.to_i
          max_index = i
        end
      end
      current_index += max_index + 1
      batteries << max
    end
    joltage += batteries.join.to_i
  end

  puts joltage
end

part_1(input)
part_2(input)