defprotocol Utility do
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end

defmodule User do
  defstruct [:name, :age]
end

defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  @fallback_to_any true
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end
defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end
defimpl Size, for: MapSet do
  def size(set), do: MapSet.size(set)
end
defimpl Size, for: User do
  def size(_user), do: 2
end
defimpl Size, for: Any do
  def size(_), do: 0
end
defmodule OtherUser do
  @derive [Size]
  defstruct [:name, :age]
end
