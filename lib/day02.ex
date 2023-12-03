defmodule Day02.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&game_check/1)
    |> Enum.reduce(0, fn val, acc ->
      valid = elem(val, 1)
      if valid == true do
        acc + elem(val, 0)
      else 
        acc
      end
    end)

  end

  def game_check(line) do
    lineNum = String.split(line, ":", trim: true)
    lineNum = Regex.run(~r/Game (\d*)/, Enum.at(lineNum, 0))
    {num, _} = Integer.parse(Enum.at(lineNum, 1))

    valid =
      line
      |> String.split(";", trim: true)
      |> Enum.map(&box_count/1)
      |> Enum.reduce(fn x, acc -> x and acc end)

    {num, valid}
  end

  def box_count(game) do
    x = Regex.run(~r/(\d*) blue/, game)

    blue =
      if x != nil do
        count = Enum.at(x, 1)
        countInt = Integer.parse(count)
        elem(countInt, 0) < 15
      end

    blue =
      if blue == nil do
        true
      else
        blue
      end

    x = Regex.run(~r/(\d*) green/, game)

    green =
      if x != nil do
        count = Enum.at(x, 1)
        countInt = Integer.parse(count)
        elem(countInt, 0) < 14
      end

    green =
      if green == nil do
        true
      else
        green
      end

    x = Regex.run(~r/(\d*) red/, game)

    red =
      if x != nil do
        count = Enum.at(x, 1)
        countInt = Integer.parse(count)
        elem(countInt, 0) < 13
      end

    red =
      if red == nil do
        true
      else
        red
      end

    blue and red and green
  end
end

defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day02-input.txt")
    IO.inspect(Day02.Part1.solve(input))
  end
end
