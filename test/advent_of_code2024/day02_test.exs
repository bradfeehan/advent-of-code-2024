defmodule AdventOfCode2024.Day02Test do
  use ExUnit.Case
  doctest AdventOfCode2024.Day02

  alias AdventOfCode2024.Day02

  @example_input """
  7 6 4 2 1
  1 2 7 8 9
  9 7 6 2 1
  1 3 2 4 5
  8 6 4 4 1
  1 3 6 7 9
  """

  describe "part1/1" do
    test "solves the example case" do
      assert Day02.part1(@example_input) == 2
    end

    test "handles empty input" do
      assert Day02.part1("") == 0
    end

    test "handles single safe sequence" do
      assert Day02.part1("1 2 3 4 5") == 1
    end

    test "handles single unsafe sequence" do
      assert Day02.part1("1 5 2 3 4") == 0
    end
  end

  describe "part2/1" do
    test "solves the example case" do
      assert Day02.part2(@example_input) == 4
    end

    test "handles empty input" do
      assert Day02.part2("") == 0
    end

    test "handles sequence that becomes safe by removing a number" do
      # Safe by removing 3
      assert Day02.part2("1 3 2 4 5") == 1
    end

    test "handles sequence that's already safe" do
      # Safe without removing anything
      assert Day02.part2("1 2 3 4 5") == 1
    end

    test "handles sequence that can't be made safe" do
      # Can't be made safe
      assert Day02.part2("1 2 7 8 9") == 0
    end
  end
end
