defmodule Day01.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&process_line/1)
    |> Enum.sum()
  end

  def process_line(line) do
    line
    |> String.codepoints()
    |> Enum.map(&:binary.first/1)
    |> Enum.filter(fn x -> 47 < x and x < 58 end)
    |> sum_line()
  end

  def sum_line(chars) do
    [List.first(chars), List.last(chars)]
    |> List.to_string()
    |> Integer.parse()
    |> elem(0)
  end
end

defmodule Day01.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&replace_chars_with_digits/1)
    |> Enum.map(&Day01.Part1.process_line/1)
    |> Enum.sum()
  end

  def replace_chars_with_digits(line) do
    line
    |> String.replace("zero", "0")
    |> String.replace("one", "1")
    |> String.replace("two", "2")
    |> String.replace("three", "3")
    |> String.replace("four", "4")
    |> String.replace("five", "5")
    |> String.replace("six", "6")
    |> String.replace("seven", "7")
    |> String.replace("eight", "8")
    |> String.replace("nine", "9")
  end
end

defmodule Mix.Tasks.Day01 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day01-input.txt")
    IO.puts("-------- Part 1 -------")
    IO.inspect(Day01.Part1.solve(input))
    IO.puts("")
    IO.puts("-------- Part 2 -------")
    IO.inspect(Day01.Part2.solve(input))
  end
end
