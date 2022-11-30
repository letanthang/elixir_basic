defmodule TestWith do
  import Integer
  def devideInt(m, key) do
    with {:ok, res} <- Map.fetch(m, key),
      true <- is_even(res) do
      IO.puts("Divided by 2 it is #{div(res, 2)}")
    else
      :error -> IO.puts("We don't have this item in map")
      _ -> IO.puts("It's not odd")
    end
  end
end
