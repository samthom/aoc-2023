defmodule Day04.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      x |> String.split(":", trim: true) |> Enum.at(1) |> String.trim()
    end)
    |> Enum.map(&find_win/1)
    |> Enum.sum()
  end

  def find_win(card) do
    winning_numbers =
      card
      |> String.split("|", trim: true)
      |> Enum.at(0)
      |> String.split(" ", trim: true)

    my_numbers =
      card
      |> String.split("|", trim: true)
      |> Enum.at(1)
      |> String.split(" ", trim: true)

    map_winning_numbers = MapSet.new(winning_numbers)
    map_my_numbers = MapSet.new(my_numbers)

    if MapSet.disjoint?(map_winning_numbers, map_my_numbers) do
      0
    else
      my_winning_numbers = MapSet.intersection(map_winning_numbers, map_my_numbers)
      l = MapSet.size(my_winning_numbers)
      2 ** (l - 1)
    end
  end
end


defmodule Mix.Tasks.Day04 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day04-input.txt")

    IO.puts("---------- Part 1 -----------------")
    IO.inspect(Day04.Part1.solve(input))
  end
end
