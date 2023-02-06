defmodule ListHelper do
  def length(list, acc \\ 0)
  def length([], acc), do: acc

  def length([_head | tail], acc) do
    length(tail, acc + 1)
  end
end
