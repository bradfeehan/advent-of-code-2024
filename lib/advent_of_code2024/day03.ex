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
  Solves part 2 of the day's challenge by handling do() and don't() instructions.
  - do() enables future mul instructions
  - don't() disables future mul instructions
  - mul instructions start enabled
  - only the most recent do() or don't() instruction applies
  """
  def part2(input) do
    # Find all instructions in order: mul(X,Y), do(), and don't()
    instructions =
      Regex.scan(~r/(?:mul\((\d{1,3}),(\d{1,3})\)|do\(\)|don't\(\))/, input)
      |> Enum.map(fn
        ["do()" | _] -> {:do}
        ["don't()" | _] -> {:dont}
        [mul, x, y] -> {:mul, String.to_integer(x), String.to_integer(y)}
      end)

    # Process instructions in order, tracking enabled state
    {_enabled, sum} =
      Enum.reduce(instructions, {true, 0}, fn
        {:do}, {_enabled, sum} -> {true, sum}
        {:dont}, {_enabled, sum} -> {false, sum}
        {:mul, x, y}, {enabled, sum} -> {enabled, sum + if(enabled, do: x * y, else: 0)}
      end)

    sum
  end
end
