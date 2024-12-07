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

  @non_matching_input """
    M S
    M S
     A
    S M
    A
  """

  test "part2 with simple X-MAS pattern" do
    # This should find exactly one X-MAS pattern:
    # M S  (M on down-diagonal and S on up-diagonal)
    #  A   (A in center)
    # M S  (M on up-diagonal and S on down-diagonal)
    # so the diagonals are M S and S M
    # as long as the diagonals are one of each, all good
    assert Day04.part2(@simple_input) == 1
  end

  test "part2 with swapped M-S pattern should not match" do
    # This should find no X-MAS patterns.
    # The \ diagonal has MAM, and the / diagonal has SAS.

    assert Day04.part2(@non_matching_input) == 0
  end
end
