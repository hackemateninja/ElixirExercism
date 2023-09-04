defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(_volume_pair = {unit, volume}) do
    case unit do
      unit when unit === :cup -> {:milliliter, volume * 240}
      unit when unit === :fluid_ounce -> {:milliliter, volume * 30}
      unit when unit === :teaspoon -> {:milliliter, volume * 5}
      unit when unit === :tablespoon -> {:milliliter, volume * 15}
      _ -> {:milliliter, volume}
    end
  end

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair)
    case unit do
      unit when unit === :cup -> {unit, volume / 240}
      unit when unit === :fluid_ounce -> {unit, volume / 30}
      unit when unit === :teaspoon -> {unit, volume / 5}
      unit when unit === :tablespoon -> {unit, volume / 15}
      _ -> {unit, volume}
    end
  end

  def convert(volume_pair, unit) do
    ml = to_milliliter(volume_pair)
    from_milliliter(ml, unit)
  end
end
