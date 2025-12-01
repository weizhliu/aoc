defmodule Y2025.D1Test do
  use ExUnit.Case

  @simple_input """
  L68
  L30
  R48
  L5
  R60
  L55
  L1
  L99
  R14
  L82
  """

  test "part1" do
    assert Y2025.D1.part1(@simple_input) == 3
  end

  test "part2" do
    assert Y2025.D1.part2(@simple_input) == 6
  end
end
