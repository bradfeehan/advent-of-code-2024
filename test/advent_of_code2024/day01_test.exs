defmodule AdventOfCode2024.Day01Test do
  use ExUnit.Case
  alias AdventOfCode2024.Day01
  doctest AdventOfCode2024.Day01

  describe "part1/1" do
    test "handles single pair" do
      input = "1   5\n"
      assert Day01.part1(input) == 4
    end

    test "handles identical numbers in different orders" do
      input = """
      3   7
      7   1
      1   3
      """

      assert Day01.part1(input) == 0
    end

    test "handles negative differences" do
      input = """
      7   2
      10  4
      15  8
      """

      # (5 + 6 + 7)
      assert Day01.part1(input) == 18
    end

    test "handles negative numbers" do
      input = """
      -3   5
      -7   -2
      4    -6
      """

      assert Day01.part1(input) == 3
    end

    test "handles empty input" do
      assert Day01.part1("") == 0
    end

    test "handles malformed input" do
      assert_raise ArgumentError, fn ->
        Day01.part1("not-a-number  5\n")
      end

      assert_raise MatchError, fn ->
        Day01.part1("1  2  3\n")
      end

      assert_raise MatchError, fn ->
        Day01.part1("1\n")
      end
    end
  end

  describe "part2/1" do
    test "placeholder - doesn't raise" do
      input = "1   2\n"
      Day01.part2(input)
    end
  end
end
