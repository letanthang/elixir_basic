defmodule Math do
  def sum(a,b) do
    do_sum(a,b)
  end

  defp do_sum(a, b) do
    a+b
  end

  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end

  def is_zero(0), do: true
  def is_zero(x) when is_integer(x), do: false

end

IO.puts(Math.sum(1,2))
# IO.puts Math.do_sum(1,2)
IO.puts Math.zero?(0)
IO.puts Math.zero?(10)
# IO.puts Math.zero?("a")
IO.puts Math.is_zero(11)


