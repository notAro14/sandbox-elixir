defmodule Fraction do
  defstruct a: nil, b: nil
  def new(a, b), do: %Fraction{a: a, b: b}
  def value(%Fraction{:a => a, :b => b}), do: a / b

  def add(%Fraction{a: a1, b: b1}, %Fraction{a: a2, b: b2}) do
    a = a1 * b2 + a2 * b1
    b = b1 * b2
    new(a, b)
  end
end
