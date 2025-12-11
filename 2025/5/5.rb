file_name = '5_input.txt'
input = File.read(file_name)

def part_1 input
  fresh_ingredients = 0

  fresh_ranges_string, ingredients = input.split(/\n\n/)

  fresh_ranges = []
  fresh_ranges_string.split(/\n/).each do |fresh_range|
    fresh_ranges << fresh_range.split('-').map(&:to_i)
  end

  ingredients.split(/\n/).each do |ingredient|
    ingredient = ingredient.to_i
    fresh_ranges.each do |fresh_range|
      if ingredient >= fresh_range[0] && ingredient <= fresh_range[1]
        fresh_ingredients += 1
        break
      end
    end
  end

  puts fresh_ingredients
end

def part_2 input
  fresh_ingredients = 0

  fresh_ranges_string, ingredients = input.split(/\n\n/)

  fresh_ranges = []
  fresh_ranges_string.split(/\n/).each do |fresh_range|
    first, last = fresh_range.split('-').map(&:to_i)
    ranges_to_delete = []
    fresh_ranges.each_with_index do |existing_range, index|
      if first <= existing_range[0] && last >= existing_range[1]
        ranges_to_delete << index
      end
      if first >= existing_range[0] && first <= existing_range[1]
        first = existing_range[0]
        ranges_to_delete << index
      end
      if last >= existing_range[0] && last <= existing_range[1]
        last = existing_range[1]
        ranges_to_delete << index
      end
    end
    ranges_to_delete.uniq.sort.reverse.each do |i|
      fresh_ranges.delete_at(i)
    end
    fresh_ranges << [first, last]
  end

  fresh_ranges.sort.each do |fresh_range|
    fresh_ingredients += fresh_range[1] - fresh_range[0] + 1
  end
  puts fresh_ingredients
end

part_1(input)
part_2(input)