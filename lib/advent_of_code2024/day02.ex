defmodule AdventOfCode2024.Day02 do
  @moduledoc """
  Solution for Advent of Code 2024, Day 2
  """

  @doc """
  Solves part 1 of the day's challenge by counting the number of safe sequences.
  A sequence is safe if:
  1. The numbers are either all increasing or all decreasing
  2. Adjacent numbers differ by at least 1 and at most 3
  """
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.count(&safe_sequence?/1)
  end

  @doc """
  Determines if a sequence is safe based on the rules
  """
  def safe_sequence?(line) when is_binary(line) do
    numbers = line |> String.split() |> Enum.map(&String.to_integer/1)
    safe_sequence?(numbers)
  end

  def safe_sequence?(numbers) when is_list(numbers) do
    case numbers do
      [] ->
        false

      [_] ->
        true

      numbers ->
        differences =
          Enum.zip(numbers, tl(numbers))
          |> Enum.map(fn {a, b} -> b - a end)

        all_increasing = Enum.all?(differences, &(&1 > 0 and &1 <= 3))
        all_decreasing = Enum.all?(differences, &(&1 < 0 and &1 >= -3))

        (all_increasing or all_decreasing) and not Enum.member?(differences, 0)
    end
  end

  @doc """
  Solves part 2 of the day's challenge, which includes the Problem Dampener.
  A sequence is now safe if either:
  1. It's safe according to the original rules, OR
  2. It would become safe if we removed any single number from the sequence
  """
  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.count(&safe_with_dampener?/1)
  end

  @doc """
  Determines if a sequence is safe with the Problem Dampener
  """
  def safe_with_dampener?(line) when is_binary(line) do
    numbers = line |> String.split() |> Enum.map(&String.to_integer/1)
    safe_with_dampener?(numbers)
  end

  def safe_with_dampener?(numbers) when is_list(numbers) do
    # First check if it's already safe
    if safe_sequence?(numbers) do
      true
    else
      # Try removing each number one at a time
      0..(length(numbers) - 1)
      |> Enum.any?(fn i ->
        {left, [_ | right]} = Enum.split(numbers, i)
        safe_sequence?(left ++ right)
      end)
    end
  end
end
