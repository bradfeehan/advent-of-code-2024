defmodule AdventOfCode2024.Day04Test do
  use ExUnit.Case
  alias AdventOfCode2024.Day04

  @simple_input """
    M S
    M S
     A
    M S
    A
  """

  @tag :focus
  test "part2 with simple X-MAS pattern" do
    # This should find exactly one X-MAS pattern:
    # M S  (M and S on both diagonals)
    #  A   (A in center)
    # M S  (M and S on both diagonals)
    assert Day04.part2(@simple_input) == 1
  end
end
