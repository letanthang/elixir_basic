defmodule Concat do
  # A function head declaring defaults
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

defmodule DefaultTest do
  def dowork(x \\ "hello") do
    x
  end
end

defmodule Recursion do
  def print_multiple_times(msg, n) when n>0 do
    IO.puts(msg)
    print_multiple_times(msg, n-1)
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end
end

defmodule Recursion2 do
  def print_multiple_times(_msg, 0) do
    :ok
  end
  def print_multiple_times(msg, n) do
    IO.puts(msg)
    print_multiple_times(msg, n-1)
  end
end

# reduce
defmodule Math do
  def sum_list([head|tail], accumulator) do
    sum_list(tail, accumulator + head)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def double_each([head|tail]) do
    [head*2|double_each(tail)]
  end

  def double_each([]) do
    []
  end
end


IO.puts Concat.join("Hello", "World")
IO.puts Concat.join("Hello","World","_")

IO.puts Math.sum_list([1,2,3],0)
IO.puts Math.double_each([1,2,3])

Enum.map(%{1=>5, 4=>3}, fn {k,v} -> k*v end)
[1,2,3]|>Enum.map(&(&1*3))|>Enum.filter(&(rem(&1,2)!=0))|>Enum.sum
[1,2,3]|>Enum.map(&(&1*3))|>Enum.filter(&(rem(&1,2)!=0))|>Enum.reduce(&+/2)
[1,2,3]|>Enum.map(&(&1*3))|>Enum.filter(&(rem(&1,2)!=0))|>Enum.reduce(&(&1+&2))
1..3|>Enum.map(&(&1*3))|>Enum.filter(&(rem(&1,2)!=0))|>Enum.reduce(&+/2)

stream = Stream.cycle([1,2,3])
IO.puts Enum.take(stream, 10)


#  send & receive
pid = spawn(fn -> 1 + 2 end)

send(self(), {:hello, "world"})
receive do
  {:hello, msg} -> msg
after
  5000 -> "5s has pass"
end



parent = self()
spawn(fn -> send(parent, {:hello, self()}) end)
receive do
  {:hello, pid} -> "Got hello from #{inspect pid}"
end

Task.start(fn -> raise "oops" end)

send(pid, {:put, "first_name", "Thang"})
send(pid, {:get, "first_name", self()})

Process.register(pid, :kv)


{:ok, pid} = Agent.start_link(fn -> %{} end)

Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
Agent.get(pid, fn map -> Map.get(map, :hello) end)
