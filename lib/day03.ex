defmodule Day03.Part1 do
  def solve(input) do
    list_of_strings = String.split(input, "\n", trim: true)
    number_map = build_number_map(list_of_strings)
    number_map
  end

  def build_number_map(list) do
    list |> Enum.with_index()
  end
end


defmodule Mix.Tasks.Day03 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day03-input.txt")
    IO.inspect(Day03.Part1.solve(input))
  end
  
end
