defmodule GuessingGame do


  def compare(secret_number, guess \\ :no_guess)
  def compare(_, :no_guess), do: "Make a guess"

  def compare(secret_number, guess) when secret_number === guess do
    "Correct"
  end

  def compare(secret_number, guess) when abs(guess - secret_number) === 1 do
    "So close"
  end

  def compare(secret_number, guess) when secret_number > guess do
    "Too low"
  end

  def compare(secret_number, guess) when secret_number < guess do
    "Too high"
  end
end
