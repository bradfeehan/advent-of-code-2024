defmodule AdventOfCode2024.Day04Test do
  use ExUnit.Case
  alias AdventOfCode2024.Day04

  @sample_input """
  MMMSXXMASM
  MSAMXMSMSA
  AMXSXMAAMM
  MSAMASMSMX
  XMASAMXAMM
  XXAMMXXAMA
  SMSMSASXSS
  SAXAMASAAA
  MAMMMXMMMM
  MXMXAXMASX
  """

  test "part1 with sample input" do
    assert Day04.part1(@sample_input) == 18
  end

  test "part2 with sample input" do
    assert Day04.part2(@sample_input) == 9
  end
end
