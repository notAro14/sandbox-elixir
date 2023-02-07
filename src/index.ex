defmodule ListHelper do
  def length(list, acc \\ 0)
  def length([], acc), do: acc

  def length([_head | tail], acc) do
    length(tail, acc + 1)
  end

  defp multiply(n) when is_number(n), do: n * 2

  def double(list), do: Enum.map(list, &multiply/1)
end
