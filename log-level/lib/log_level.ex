defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level === 0 and not(legacy?) -> :trace
      level === 1 and not(legacy?) -> :debug
      level === 1 and legacy? -> :debug
      level === 2 and not(legacy?) -> :info
      level === 2 and legacy? -> :info
      level === 3 and not(legacy?) -> :warning
      level === 3 and legacy? -> :warning
      level === 4 and not(legacy?) -> :error
      level === 4 and legacy? -> :error
      level === 5 and not(legacy?) -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label === :error or label === :fatal -> :ops
      label === :unknown and legacy? -> :dev1
      label === :unknown and not(legacy?) -> :dev2
      true -> false
    end

  end
end
