defmodule Y2025.D2 do
  def part1(input) do
    for [first, last] <- parse_as_pairs(input),
        number <- first..last,
        str_number = Integer.to_string(number),
        length = String.length(str_number),
        match?({match, match}, String.split_at(str_number, div(length, 2))),
        reduce: 0 do
      acc ->
        acc + number
    end
  end

  def part2(input) do
    for [first, last] <- parse_as_pairs(input),
        number <- first..last,
        str_number = Integer.to_string(number),
        length = String.length(str_number),
        code_points = String.codepoints(str_number),
        part_length <- 1..div(length, 2),
        length != 1,
        chunks = Enum.chunk_every(code_points, part_length),
        length(Enum.dedup(chunks)) == 1,
        uniq: true do
      number
    end
    |> Enum.sum()
  end

  def parse_as_pairs(input) do
    input
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(fn raw_pair ->
      raw_pair
      |> String.split("-", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
