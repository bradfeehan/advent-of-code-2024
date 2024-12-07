defmodule AdventOfCode2024.Day03Test do
  use ExUnit.Case
  doctest AdventOfCode2024.Day03

  alias AdventOfCode2024.Day03

  @example_input "x mul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

  describe "part1/1" do
    test "solves the example case" do
      assert Day03.part1(@example_input) == 161
    end

    test "handles empty input" do
      assert Day03.part1("") == 0
    end

    test "handles single valid mul instruction" do
      assert Day03.part1("mul(2,3)") == 6
    end

    test "handles invalid mul instructions" do
      assert Day03.part1("mul(4*") == 0
      assert Day03.part1("mul(6,9!") == 0
      assert Day03.part1("?(12,34)") == 0
      assert Day03.part1("mul ( 2 , 4 )") == 0
    end

    test "handles multiple valid mul instructions" do
      assert Day03.part1("mul(2,3)mul(4,5)") == 26
    end
  end

  describe "part2/1" do
    test "solves the example case" do
      assert Day03.part2(@example_input) == 0
    end

    test "handles empty input" do
      assert Day03.part2("") == 0
    end
  end
end
