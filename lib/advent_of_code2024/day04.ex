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

    positions =
      for i <- 1..(rows - 2),
          j <- 1..(cols - 2),
          Map.get(grid, {i, j}) == "A",
          has_x_pattern?(grid, {i, j}),
          into: MapSet.new(),
          do: {i, j}

    MapSet.size(positions)
  end

  defp has_x_pattern?(grid, {row, col}) do
    diagonal1 = [Map.get(grid, {row - 1, col - 1}), Map.get(grid, {row + 1, col + 1})]
    diagonal2 = [Map.get(grid, {row - 1, col + 1}), Map.get(grid, {row + 1, col - 1})]
    valid_diagonal?(diagonal1) and valid_diagonal?(diagonal2)
  end

  defp valid_diagonal?([a, b]), do: [a, b] in [["M", "S"], ["S", "M"]]
end
