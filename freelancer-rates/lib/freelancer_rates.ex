defmodule FreelancerRates do
  @hourly 8.0
  @days 22

  def daily_rate(hourly_rate), do: @hourly * hourly_rate

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * (discount / 100))
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate = daily_rate(hourly_rate) * @days
    apply_discount(monthly_rate, discount)|>ceil|>trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    total =
      hourly_rate
      |>daily_rate
      |>apply_discount(discount)

    budget / total |>Float.floor(1)

  end
end
