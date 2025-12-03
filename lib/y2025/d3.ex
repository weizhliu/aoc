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
    |> parse_to_lines()
    |> Enum.map(fn line ->
      line
      |> search2()
      |> Enum.join()
      |> String.to_integer()
    end)
    |> Enum.sum()
  end

  # "Remove K Digits" algorithm (solved with LLM assistance)
  # Greedy + monotonic stack: remove k digits to maximize result

  def search2(line) do
    k = length(line) - 12
    search2(line, [], k) |> Enum.reverse() |> Enum.take(12)
  end

  def search2([], stack, _k), do: stack
  def search2([h | t], [], k), do: search2(t, [h], k)
  def search2([h | t], [top | rest], k) when h > top and k > 0, do: search2([h | t], rest, k - 1)
  def search2([h | t], stack, k), do: search2(t, [h | stack], k)
end
