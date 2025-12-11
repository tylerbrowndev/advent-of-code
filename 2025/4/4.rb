file_name = '4_input.txt'
input = File.read(file_name)

def part_1 input
  accessible_rolls = 0

  grid = []
  input.split(/\n/).each do |instruction|
    grid << instruction.chars
  end

  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      next if cell == "."
      occupied_neighbors = 0
      unless i == 0
        # row above
        unless j == 0
          if grid[i - 1][j - 1] == "@"
            occupied_neighbors += 1
          end
        end
        if grid[i - 1][j] == "@"
          occupied_neighbors += 1
        end
        unless j == grid[0].length - 1
          if grid[i - 1][j + 1] == "@"
            occupied_neighbors += 1
          end
        end
      end

      # current row
      unless j == 0
        if grid[i][j - 1] == "@"
          occupied_neighbors += 1
        end
      end
      unless j == grid[0].length - 1
        if grid[i][j + 1] == "@"
          occupied_neighbors += 1
        end
      end

      # row below
      unless i == grid.length - 1
        unless j == 0
          if grid[i + 1][j - 1] == "@"
            occupied_neighbors += 1
          end
        end
        if grid[i + 1][j] == "@"
          occupied_neighbors += 1
        end
        unless j == grid[0].length - 1
          if grid[i + 1][j + 1] == "@"
            occupied_neighbors += 1
          end
        end
      end
      if occupied_neighbors < 4
        accessible_rolls += 1
      end
    end
  end

  puts accessible_rolls
end

def part_2 input
  accessible_rolls = 0

  grid = []
  input.split(/\n/).each do |instruction|
    grid << instruction.chars
  end

  rolls_removed = 1
  while rolls_removed > 0
    rolls_removed = 0
    grid.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        next if cell == "."
        occupied_neighbors = 0
        unless i == 0
          # row above
          unless j == 0
            if grid[i - 1][j - 1] == "@"
              occupied_neighbors += 1
            end
          end
          if grid[i - 1][j] == "@"
            occupied_neighbors += 1
          end
          unless j == grid[0].length - 1
            if grid[i - 1][j + 1] == "@"
              occupied_neighbors += 1
            end
          end
        end

        # current row
        unless j == 0
          if grid[i][j - 1] == "@"
            occupied_neighbors += 1
          end
        end
        unless j == grid[0].length - 1
          if grid[i][j + 1] == "@"
            occupied_neighbors += 1
          end
        end

        # row below
        unless i == grid.length - 1
          unless j == 0
            if grid[i + 1][j - 1] == "@"
              occupied_neighbors += 1
            end
          end
          if grid[i + 1][j] == "@"
            occupied_neighbors += 1
          end
          unless j == grid[0].length - 1
            if grid[i + 1][j + 1] == "@"
              occupied_neighbors += 1
            end
          end
        end
        if occupied_neighbors < 4
          accessible_rolls += 1
          rolls_removed += 1
          grid[i][j] = "."
        end
      end
    end
  end

  puts accessible_rolls
end

part_1(input)
part_2(input)