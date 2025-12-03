defmodule Y2025.D3 do
  def part1(input) do
    input
    |> parse_to_lines()
    |> Enum.map(&search/1)
    |> Enum.sum()
  end

  def search(line) do
    {ln, rn} = search(line, 0, 0)
    String.to_integer("#{ln}#{rn}")
  end

  def search([], ln, rn), do: {ln, rn}
  def search([last], ln, _rn) when last > ln, do: {ln, last}
  def search([h | t], ln, _rn) when h > ln, do: search(t, h, 0)
  def search([h | t], ln, rn) when h > rn, do: search(t, ln, h)
  def search([_h | t], ln, rn), do: search(t, ln, rn)

  def parse_to_lines(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.codepoints()
      |> Enum.map(&String.to_integer/1)
    end)
  end

  def part2(input) do
    input
  end
end
