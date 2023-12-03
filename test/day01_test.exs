defmodule Day01Test do
  use ExUnit.Case
  @example_input """
  s10mseven
  ca7ther1neeight
  7homaszero
  """

  test "solves example input for part 1" do
    assert Day01.Part1.solve(@example_input) == 158
  end

  test "solves example input for part 2" do
    assert Day01.Part2.solve(@example_input) == 165
  end

end
