defmodule Y2025.D1 do
  def part1(input) do
    input
    |> parse()
    |> Enum.reduce({0, 50}, fn value, {clicks, current} ->
      new_number = current + value

      if rem(new_number, 100) == 0 do
        {clicks + 1, new_number}
      else
        {clicks, new_number}
      end
    end)
    |> elem(0)
  end

  def part2(input) do
    input
    |> parse()
    |> Enum.reduce({0, 50}, fn value, {clicks, current} ->
      new = current + value
      wrap_click = if new <= 0 && current != 0, do: 1, else: 0

      {abs(div(new, 100)) + clicks + wrap_click, Integer.mod(new, 100)}
    end)
    |> elem(0)
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "L" <> n -> -String.to_integer(n)
      "R" <> n -> String.to_integer(n)
    end)
  end
end
