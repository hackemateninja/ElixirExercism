defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    point = :math.sqrt(x*x + y *y)
    cond do
      point > 10 -> 0
      point > 5 and point <= 10 -> 1
      point > 1 and point <= 5 -> 5
      point <= 1 -> 10
      true -> 0
    end
  end
end
