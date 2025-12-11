file_name = '2_input.txt'
input = File.read(file_name)

def part_1 input
  invalid_sum = 0

  input.split(/\,/).each do |instruction|
    first, last = instruction.split('-').map(&:to_i)
    (first..last).each do |n|
      n_string = n.to_s
      if n_string[0...n_string.length / 2] == n_string[n_string.length / 2..-1]
        invalid_sum += n
      end
    end
  end

  puts invalid_sum
end

def part_2 input
  invalid_sum = 0

  input.split(/\,/).each do |instruction|
    first, last = instruction.split('-').map(&:to_i)
    (first..last).each do |n|
      n_string = n.to_s
      i = 0
      while i < n_string.length / 2
        if n_string.gsub(n_string[0..i], '').length == 0
          invalid_sum += n
          break
        end
        i += 1
      end
    end
  end

  puts invalid_sum
end

part_1(input)
part_2(input)