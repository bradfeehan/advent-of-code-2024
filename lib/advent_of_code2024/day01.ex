defmodule AdventOfCode2024.Day01 do
  @moduledoc """
  Solution for Advent of Code 2024, Day 1
  """

  @doc """
  Solves part 1 of the day's challenge

  ## Examples

      iex> input = \"""
      ...> 3   4
      ...> 4   3
      ...> 2   5
      ...> 1   3
      ...> 3   9
      ...> 3   3
      ...> \"""
      iex> AdventOfCode2024.Day01.part1(input)
      11

  """
  def part1(input) do
    {left_list, right_list} =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        [left, right] = String.split(line, ~r/\s+/, trim: true)
        {String.to_integer(left), String.to_integer(right)}
      end)
      |> Enum.unzip()

    left_sorted = Enum.sort(left_list)
    right_sorted = Enum.sort(right_list)

    Enum.zip(left_sorted, right_sorted)
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  @doc """
  Solves part 2 of the day's challenge
  """
  def part2(input) do
    # We'll implement this once part 2 is revealed
    input
  end
end
