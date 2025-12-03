defmodule Y2025.D3Test do
  use ExUnit.Case

  @simple_input """
  987654321111111
  811111111111119
  234234234234278
  818181911112111
  """

  test "part1" do
    assert Y2025.D3.part1(@simple_input) == 357
  end

  test "part2" do
    assert Y2025.D3.part2(@simple_input) == 3_121_910_778_619
  end
end
