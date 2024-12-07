defmodule AdventOfCode2024.Day04 do
  @moduledoc """
  Day 4: Ceres Search
  """

  @directions [
    {0, 1},
    {0, -1},
    {1, 0},
    {-1, 0},
    {1, 1},
    {1, -1},
    {-1, 1},
    {-1, -1}
  ]

  @target ~w(X M A S)

  def part1(input) do
    grid = parse_grid(input)
    {rows, cols} = grid_dimensions(grid)

    for i <- 0..(rows - 1),
        j <- 0..(cols - 1),
        dir <- @directions,
        match = find_xmas(grid, {i, j}, dir),
        not is_nil(match),
        reduce: 0 do
      acc -> acc + 1
    end
  end

  defp parse_grid(input) do
    grid =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)
      |> Enum.with_index()
      |> Enum.flat_map(fn {row, i} ->
        row
        |> Enum.with_index()
        |> Enum.map(fn {char, j} -> {{i, j}, char} end)
      end)
      |> Map.new()

    # Debug log the grid with row/column indices
    {rows, cols} = grid_dimensions(grid)
    IO.puts("\nGrid contents (#{rows}x#{cols}):")

    # Print column indices
    IO.puts("   " <> Enum.map_join(0..(cols - 1), fn j -> "#{rem(j, 10)}" end))

    # Print grid with row indices
    for i <- 0..(rows - 1) do
      row = for j <- 0..(cols - 1), do: Map.get(grid, {i, j}, ".")
      IO.puts("#{String.pad_leading("#{i}", 2)} #{Enum.join(row)}")
    end

    IO.puts("")

    grid
  end

  defp grid_dimensions(grid) do
    {{max_row, _}, _} = Enum.max_by(grid, fn {{row, _}, _} -> row end)
    {{_, max_col}, _} = Enum.max_by(grid, fn {{_, col}, _} -> col end)
    {max_row + 1, max_col + 1}
  end

  defp find_xmas(grid, {row, col}, {dr, dc}) do
    coords = for i <- 0..3, do: {row + i * dr, col + i * dc}
    chars = Enum.map(coords, &Map.get(grid, &1))

    case chars do
      @target -> {row, col, dr, dc}
      _ -> nil
    end
  end

  @doc """
  Count the number of X-MAS patterns in the grid.
  An X-MAS pattern is formed by:
  - An 'A' at the center
  - Two diagonal pairs of 'M' and 'S', forming an X shape
  """
  def part2(input) do
    grid = parse_grid(input)
    {rows, cols} = grid_dimensions(grid)

    # Find all 'A' positions that form an X-MAS pattern
    positions =
      for i <- 0..(rows - 1),
          j <- 0..(cols - 1),
          Map.get(grid, {i, j}) == "A",
          has_x_pattern?(grid, {i, j}),
          into: MapSet.new(),
          do: {i, j}

    IO.puts("\nFound X-MAS patterns at:")
    Enum.each(positions, &IO.puts("  #{inspect(&1)}"))

    MapSet.size(positions)
  end

  # Check if a position has an X-MAS pattern by looking at its diagonals
  defp has_x_pattern?(grid, {row, col} = pos) do
    # Check the four diagonal positions around the center
    diagonals = [
      # up-left
      {row - 1, col - 1},
      # up-right
      {row - 1, col + 1},
      # down-left
      {row + 1, col - 1},
      # down-right
      {row + 1, col + 1}
    ]

    # Get the characters at these positions
    chars = Enum.map(diagonals, &Map.get(grid, &1))
    IO.puts("\nChecking position #{inspect(pos)}:")
    IO.puts("  Diagonal chars: #{inspect(chars)}")

    # Count M's and S's
    m_count = Enum.count(chars, &(&1 == "M"))
    s_count = Enum.count(chars, &(&1 == "S"))

    # We need exactly two M's and two S's
    result = m_count == 2 and s_count == 2
    IO.puts("  M count: #{m_count}, S count: #{s_count}")
    IO.puts("  Valid X-MAS pattern? #{result}")
    result
  end
end
