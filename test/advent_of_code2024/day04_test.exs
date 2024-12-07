defmodule AdventOfCode2024.Day04Test do
  use ExUnit.Case
  alias AdventOfCode2024.Day04

  @vertical_xmas """
  X_____
  M_____
  A_____
  S_____
  """

  @horizontal_xmas """
  _XMAS_
  ______
  """

  @diagonal_xmas """
  X_____
  _M____
  __A___
  ___S__
  """

  @unusual_diagonal_xmas """
  S_____
  _A____
  __M___
  ___X__
  """

  @simple_masmas """
  aXaaaa
    M S_
     A__
    M S_
   X   A
  """

  @non_matching """
  M S___
    M S_
     A__
    S M_
    A___
  """

  @example """
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

  test "part1 with vertical X-MAS pattern" do
    assert Day04.part1(@vertical_xmas) == 1
  end

  test "part1 with horizontal X-MAS pattern" do
    assert Day04.part1(@horizontal_xmas) == 1
  end

  test "part1 with diagonal X-MAS pattern" do
    assert Day04.part1(@diagonal_xmas) == 1
  end

  test "part1 with unusual diagonal X-MAS pattern" do
    assert Day04.part1(@unusual_diagonal_xmas) == 1
  end

  test "part1 with masmas pattern" do
    assert Day04.part1(@simple_masmas) == 2
  end

  test "part1 with non-matching pattern" do
    assert Day04.part1(@non_matching) == 0
  end

  test "part1 with example" do
    assert Day04.part1(@example) == 18
  end

  test "part2 with simple X-MAS pattern" do
    assert Day04.part2(@simple_masmas) == 1
  end

  test "part2 with swapped M-S pattern should not match" do
    assert Day04.part2(@non_matching) == 0
  end

  test "part2 with example" do
    assert Day04.part2(@example) == 9
  end
end
