defmodule AdventOfCode2024.Day01Test do
  use ExUnit.Case
  doctest AdventOfCode2024.Day01

  alias AdventOfCode2024.Day01

  @example_input """
  3   4
  4   3
  2   5
  1   3
  3   9
  3   3
  """

  describe "part1/1" do
    test "solves the example case" do
      assert Day01.part1(@example_input) == 11
    end

    test "handles empty input" do
      assert Day01.part1("") == 0
    end

    test "handles single line" do
      assert Day01.part1("5   8") == 3
    end
  end

  describe "part2/1" do
    test "solves the example case" do
      assert Day01.part2(@example_input) == 31
    end

    test "handles empty input" do
      assert Day01.part2("") == 0
    end

    test "handles single line" do
      assert Day01.part2("5   5") == 5
    end

    test "handles case with no matches" do
      input = """
      1   2
      3   4
      5   6
      """

      assert Day01.part2(input) == 0
    end

    test "handles case with all matches" do
      input = """
      2   2
      2   2
      """

      assert Day01.part2(input) == 8
    end
  end
end
