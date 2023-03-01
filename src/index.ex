defmodule ListHelper do
  def length(list, acc \\ 0)
  def length([], acc), do: acc

  def length([_head | tail], acc) do
    length(tail, acc + 1)
  end

  defp multiply(n) when is_number(n), do: n * 2

  def double(list), do: Enum.map(list, &multiply/1)
end

defmodule FileReader do
  def reverse_haiku!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.map(&String.reverse(&1))
  end

  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(fn line -> String.replace(line, "\n", "") end)
    |> Enum.map(fn line -> length(String.split(line)) end)
  end

  def total_words!(path) do
    words_per_line(path)
    |> Enum.reduce(0, &+/2)
  end
end
