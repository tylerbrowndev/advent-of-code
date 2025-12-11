file_name = '1_input.txt'
input = File.read(file_name)

def part_1 input
  cur = 50
  counter = 0

  input.split(/\n/).each do |instruction|
    direction = instruction[0]
    n = instruction[1..-1].to_i
    if instruction[0] == "L"
      cur = (cur - n) % 100
    else
      cur = (cur + n) % 100
    end
    if cur == 0
      counter += 1
    end
  end
  puts counter
end

def part_2 input
  cur = 50
  counter = 0

  input.split(/\n/).each do |instruction|
    direction = instruction[0]
    n = instruction[1..-1].to_i
    
    if instruction[0] == "L"
      counter += (((100 - cur) % 100) + n) / 100
      puts "cur: #{cur} n: #{instruction} next: #{(cur - n) % 100} times: #{(100 - cur + n) / 100}"
      cur = (cur - n) % 100
    else
      counter += (cur + n) / 100
      puts "cur: #{cur} n: #{instruction} next: #{(cur + n) % 100} times: #{(cur + n) / 100}"
      cur = (cur + n) % 100
    end
  end
  puts counter
end

part_1(input)
part_2(input)