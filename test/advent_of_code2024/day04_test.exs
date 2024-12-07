defmodule AdventOfCode2024.Day04Test do
  use ExUnit.Case
  alias AdventOfCode2024.Day04

  @simple_input """
  aaaaaa
    M S_
     A__
    M S_
       A
  """

  @non_matching_input """
  M S___
    M S_
     A__
    S M_
    A___
  """

  test "part2 with simple X-MAS pattern" do
    assert Day04.part2(@simple_input) == 1
  end

  test "part2 with swapped M-S pattern should not match" do
    assert Day04.part2(@non_matching_input) == 0
  end
end
