defmodule AdventOfCode2024.Day04 do
  @moduledoc """
  Day 4: Ceres Search
  """

  @doc """
  Count the number of times XMAS appears in the word search grid.
  XMAS can appear horizontally, vertically, diagonally, and backwards.
  """
  def part1(input) do
    grid =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)

    rows = length(grid)
    cols = length(Enum.at(grid, 0))

    # Search in all 8 directions
    directions = [
      # right
      {0, 1},
      # left
      {0, -1},
      # down
      {1, 0},
      # up
      {-1, 0},
      # down-right
      {1, 1},
      # down-left
      {1, -1},
      # up-right
      {-1, 1},
      # up-left
      {-1, -1}
    ]

    # For each position in the grid, try all directions
    for i <- 0..(rows - 1),
        j <- 0..(cols - 1),
        direction <- directions,
        reduce: 0 do
      count -> count + if check_xmas(grid, i, j, direction), do: 1, else: 0
    end
  end

  defp check_xmas(grid, row, col, {dr, dc}) do
    rows = length(grid)
    cols = length(Enum.at(grid, 0))
    target = ["X", "M", "A", "S"]

    # Check if we can fit XMAS in this direction from this position
    if row + 3 * dr >= 0 and row + 3 * dr < rows and
         col + 3 * dc >= 0 and col + 3 * dc < cols do
      # Get the four characters in this direction
      chars =
        for i <- 0..3 do
          grid
          |> Enum.at(row + i * dr)
          |> Enum.at(col + i * dc)
        end

      chars == target
    else
      false
    end
  end

  def part2(_input) do
    :not_implemented
  end
end
