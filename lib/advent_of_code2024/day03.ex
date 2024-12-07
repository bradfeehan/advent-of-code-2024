defmodule AdventOfCode2024.Day03 do
  @moduledoc """
  Solution for Advent of Code 2024, Day 3
  """

  @doc """
  Solves part 1 of the day's challenge by finding all valid mul instructions
  and summing their results.

  A valid mul instruction:
  - Must be in the format mul(X,Y) where X and Y are 1-3 digit numbers
  - Must not have any spaces or other characters between mul, (, numbers, , and )
  """
  def part1(input) do
    ~r/mul\((\d{1,3}),(\d{1,3})\)/
    |> Regex.scan(input, capture: :all_but_first)
    |> Enum.map(fn [x, y] -> String.to_integer(x) * String.to_integer(y) end)
    |> Enum.sum()
  end

  @doc """
  Solves part 2 of the day's challenge
  """
  def part2(input) do
    0
  end
end
